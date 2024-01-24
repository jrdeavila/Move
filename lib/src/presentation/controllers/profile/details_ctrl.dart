import 'package:move_app/lib.dart';

class DetailsCtrl extends GetxController {
  // -----------------------------------
  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _email = ''.obs;
  final RxBool _isDriver = false.obs;
  final RxBool _isClient = false.obs;
  final RxBool _isAdmin = false.obs;

  // -----------------------------------
  String get firstname => _firstName.value;
  String get lastname => _lastName.value;
  String get phone => _phone.value;
  String get email => _email.value;
  bool get isDriver => _isDriver.value;
  bool get isClient => _isClient.value;
  bool get isAdmin => _isAdmin.value;

  // -----------------------------------
  void setPhone(String text) {
    _phone.value = text;
  }

  void setLastName(String text) {
    _lastName.value = text;
  }

  void setFirstName(String text) {
    _firstName.value = text;
  }

  void setEmail(String text) {
    _email.value = text;
  }

  // -----------------------------------

  @override
  void onReady() {
    super.onReady();
    _loadProfile();
  }

  void _loadProfile() {
    _firstName.value = Get.find<SessionCtrl>().user!.firstname;
    _lastName.value = Get.find<SessionCtrl>().user!.lastname;
    _phone.value = PhoneConvert.fromFirebase(
        numberPhone: Get.find<SessionCtrl>().user!.phone);
    _email.value = Get.find<SessionCtrl>().user!.email;
    _isDriver.value = Get.find<SessionCtrl>().user!.isDriver;
    _isClient.value = Get.find<SessionCtrl>().user!.isClient;
    _isAdmin.value = Get.find<SessionCtrl>().user!.isAdmin;
  }

  // -----------------------------------

  void updateProfile() async {
    var appUser = Get.find<SessionCtrl>().user!;
    final updateProfileRequest = UpdateProfileRequest(
      uuid: appUser.uuid,
      firstname: _firstName.value,
      lastname: _lastName.value,
      phone: PhoneConvert.toFirebase(numberPhone: _phone.value),
      email: _email.value,
      roles: appUser.roles,
    );

    final useCase = getIt<IUpdateProfileUseCase>();
    final result = await useCase.updateProfile(updateProfileRequest);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa 😄",
      'Se ha actualizado correctamente su perfil',
    );

    Get.find<SessionCtrl>().onUpdateProfileSuccess(result);
  }
}
