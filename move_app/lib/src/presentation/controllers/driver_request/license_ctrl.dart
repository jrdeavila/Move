import 'dart:typed_data';

import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/utils/image_download.dart';

class LicenseCtrl extends GetxController {
  // ------------------------------------------------------------
  @override
  void onReady() {
    super.onReady();
    final driverLicenseSection =
        Get.find<DriverRequestRegisterCtrl>().driverLicenseSection;

    _licenseNumber.value = driverLicenseSection.driverLicense ?? '';
    _dateExpiration.value =
        driverLicenseSection.driverLicenseExpirationDate ?? '';
    imageFromNetworkImage(
      driverLicenseSection.driverLicenseFrontImage,
    ).then((value) {
      _frontLicense.value = value;
    });
    imageFromNetworkImage(
      driverLicenseSection.driverLicenseBackImage,
    ).then((value) {
      _backLicense.value = value;
    });
    imageFromNetworkImage(
      driverLicenseSection.driverLicenseConfirmation,
    ).then((value) {
      _confirmLicense.value = value;
    });
  }
  // ------------------------------------------------------------

  final RxString _licenseNumber = ''.obs;
  final RxString _dateExpiration = ''.obs;
  final Rx<Uint8List?> _frontLicense = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _backLicense = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _confirmLicense = Rx<Uint8List?>(null);

  // ------------------------------------------------------------

  final RxBool _isLoading = false.obs;

  final Rx<String?> _errorLicenseNumber = Rx<String?>(null);
  final Rx<String?> _errorDateExpiration = Rx<String?>(null);
  final Rx<String?> _errorFrontLicense = Rx<String?>(null);
  final Rx<String?> _errorBackLicense = Rx<String?>(null);
  final Rx<String?> _errorConfirmLicense = Rx<String?>(null);

  // ------------------------------------------------------------

  String get licenseNumber => _licenseNumber.value;
  String get dateExpiration => _dateExpiration.value;
  Uint8List? get frontLicense => _frontLicense.value;
  Uint8List? get backLicense => _backLicense.value;
  Uint8List? get confirmLicense => _confirmLicense.value;

  // ------------------------------------------------------------

  String? get errorLicenseNumber => _errorLicenseNumber.value;
  String? get errorDateExpiration => _errorDateExpiration.value;
  String? get errorFrontLicense => _errorFrontLicense.value;
  String? get errorBackLicense => _errorBackLicense.value;
  String? get errorConfirmLicense => _errorConfirmLicense.value;

  // ------------------------------------------------------------

  void setLicenseNumber(String value) {
    _licenseNumber.value = value;
    if (value.isEmpty) {
      _errorLicenseNumber.value = "Campo requerido";
      return;
    }
    if (value.length < 12) {
      _errorLicenseNumber.value = "El numero de licencia debe tener 12 digitos";
      return;
    }
    _errorLicenseNumber.value = null;
    return;
  }

  void setDateExpiration(String value) {
    _dateExpiration.value = value;
    if (value.isEmpty) {
      _errorDateExpiration.value = "Campo requerido";
      return;
    }
    _errorDateExpiration.value = null;
    return;
  }

  void setFrontLicense(Uint8List? value) {
    _frontLicense.value = value;
    if (value == null) {
      _errorFrontLicense.value = "Campo requerido";
      return;
    }
    _errorFrontLicense.value = null;
    return;
  }

  void setBackLicense(Uint8List? value) {
    _backLicense.value = value;
    if (value == null) {
      _errorBackLicense.value = "Campo requerido";
      return;
    }
    _errorBackLicense.value = null;
    return;
  }

  void setConfirmLicense(Uint8List? value) {
    _confirmLicense.value = value;
    if (value == null) {
      _errorConfirmLicense.value = "Campo requerido";
      return;
    }
    _errorConfirmLicense.value = null;
    return;
  }

  // ------------------------------------------------------------

  bool get isValid {
    return _errorLicenseNumber.value == null &&
        _errorDateExpiration.value == null &&
        _errorFrontLicense.value == null &&
        _errorBackLicense.value == null &&
        _errorConfirmLicense.value == null;
  }

  bool get isLoading => _isLoading.value;

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = false;
    if (isValid) {
      _isLoading.value = true;
      final useCase = getIt<ISendDriverLicenseSectionUseCase>();
      final licenseSection = await useCase.call(SendDriverLicenseSectionRequest(
        userUuid: Get.find<SessionCtrl>().user!.uuid,
        driverLicense: licenseNumber,
        driverLicenseExpirationDate: dateExpiration,
        driverLicenseBackImage: backLicense!,
        driverLicenseFrontImage: frontLicense!,
        driverLicenseConfirmation: confirmLicense!,
      ));

      _isLoading.value = false;

      Get.find<DriverRequestRegisterCtrl>()
          .onUpdateDriverLicenseSection(licenseSection);
      Get.find<BannerCtrl>().showSuccess(
        "Opeación exitosa! 🎉",
        "Se ha guardado correctamente la sección de licencia",
      );

      Get.offAndToNamed(DriverRequestRoutes.soat);
    }
  }
}
