import 'package:move_app/lib.dart';

class AboutMeCtrl extends GetxController {
  // ------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    var user = Get.find<SessionCtrl>().user;
    var aboutMeSection = Get.find<DriverRequestRegisterCtrl>().aboutMeSection;
    _firstName.value = aboutMeSection.firstName ?? user!.firstname;
    _lastName.value = aboutMeSection.lastName ?? user!.lastname;
    _email.value = aboutMeSection.email ?? user!.email;
    _birthDate.value = aboutMeSection.birthDate ?? "";
    imageFromNetworkImage(aboutMeSection.profileImage).then((value) {
      return _photo.value = value;
    });
  }

  // ------------------------------------------------------------

  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _email = ''.obs;
  final RxString _birthDate = ''.obs;
  final Rx<Uint8List?> _photo = Rx<Uint8List?>(null);

  // ------------------------------------------------------------
  final RxBool _isLoading = false.obs;

  final Rx<String?> _firstNameError = Rx<String?>(null);
  final Rx<String?> _lastNameError = Rx<String?>(null);
  final Rx<String?> _emailError = Rx<String?>(null);
  final Rx<String?> _birthDateError = Rx<String?>(null);

  // ------------------------------------------------------------

  String get getFirstName => _firstName.value;
  String get getLastName => _lastName.value;
  String get getEmail => _email.value;
  String get getBirthDate => _birthDate.value;
  Uint8List? get getPhoto => _photo.value;

  // ------------------------------------------------------------

  bool get isLoading => _isLoading.value;

  String? get getFirstNameError => _firstNameError.value;
  String? get getLastNameError => _lastNameError.value;
  String? get getEmailError => _emailError.value;
  String? get getBirthDateError => _birthDateError.value;

  // ------------------------------------------------------------

  void setFirstName(String value) {
    _firstName.value = value;
    if (value.isEmpty) {
      _firstNameError.value = 'El nombre es requerido';
      return;
    } else if (value.length < 3) {
      _firstNameError.value = 'El nombre debe tener al menos 3 caracteres';
      return;
    }
    _firstNameError.value = null;
    return;
  }

  void setLastName(String value) {
    _lastName.value = value;
    if (value.isEmpty) {
      _lastNameError.value = 'El apellido es requerido';
      return;
    }
    if (value.length < 3) {
      _lastNameError.value = 'El apellido debe tener al menos 3 caracteres';
      return;
    }
    _lastNameError.value = null;
    return;
  }

  void setEmail(String value) {
    _email.value = value;
    if (value.isEmpty) {
      _emailError.value = 'El email es requerido';

      return;
    }
    if (!value.isEmail) {
      _emailError.value = 'El email no es válido';
      return;
    }
    _emailError.value = null;
    return;
  }

  void setBirthDate(String value) {
    _birthDate.value = value;
    if (value.isEmpty) {
      _birthDateError.value = 'La fecha de nacimiento es requerida';
      return;
    }
    _birthDateError.value = null;
    return;
  }

  void setPhoto(Uint8List? value) {
    _photo.value = value;
    if (value == null) {
      Get.find<BannerCtrl>()
          .showInfo("Imagen Requerida", "Debe seleccionar una imagen");
    }
  }

  // ------------------------------------------------------------

  bool get isValid {
    return _firstNameError.value == null &&
        _lastNameError.value == null &&
        _emailError.value == null &&
        _birthDateError.value == null &&
        _photo.value != null;
  }

  // ------------------------------------------------------------

  void save() async {
    if (isValid) {
      _isLoading.value = true;
      final useCase = getIt<ISendAboutMeSectionUseCase>();
      final aboutMeSection = await useCase.call(
        SendAboutMeSectionRequest(
          userUuid: Get.find<SessionCtrl>().user!.uuid,
          firstname: getFirstName,
          lastname: getLastName,
          email: getEmail,
          birthDate: getBirthDate,
          profileImage: getPhoto!,
        ),
      );

      _isLoading.value = false;
      Get.find<DriverRequestRegisterCtrl>()
          .onUpdateAboutMeSection(aboutMeSection);
      Get.find<BannerCtrl>().showSuccess(
        "Datos personales guardados",
        "Los datos personales han sido guardados correctamente",
      );
    }
  }
}
