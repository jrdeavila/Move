import 'dart:typed_data';

import 'package:move_app/lib.dart';

class DNICtrl extends GetxController {
  // ------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    final dniSection = Get.find<DriverRequestRegisterCtrl>().dniSection;
    _dniNumber.value = dniSection.dni ?? '';
    imageFromNetworkImage(
      dniSection.dniFrontImage,
    ).then((value) {
      _frontDNI.value = value;
    });
    imageFromNetworkImage(
      dniSection.dniBackImage,
    ).then((value) {
      _backDNI.value = value;
    });
  }

  // ------------------------------------------------------------
  final RxString _dniNumber = ''.obs;
  final Rx<Uint8List?> _frontDNI = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _backDNI = Rx<Uint8List?>(null);

  // ------------------------------------------------------------

  final RxBool _isLoading = false.obs;

  final Rx<String?> _errorDniNumber = Rx<String?>(null);
  final Rx<String?> _errorFrontDNI = Rx<String?>(null);
  final Rx<String?> _errorBackDNI = Rx<String?>(null);

  // ------------------------------------------------------------

  String get dniNumber => _dniNumber.value;
  Uint8List? get frontDNI => _frontDNI.value;
  Uint8List? get backDNI => _backDNI.value;

  // ------------------------------------------------------------

  String? get errorDniNumber => _errorDniNumber.value;
  String? get errorFrontDNI => _errorFrontDNI.value;
  String? get errorBackDNI => _errorBackDNI.value;

  // ------------------------------------------------------------

  void setDniNumber(String value) {
    _dniNumber.value = value;

    if (value.isEmpty) {
      _errorDniNumber.value = 'El número de identificación es requerido';
      return;
    }
    _errorDniNumber.value = null;
    return;
  }

  void setFrontLicense(Uint8List? value) {
    _frontDNI.value = value;

    if (value == null) {
      _errorFrontDNI.value =
          'La foto frontal de la identificación es requerida';
      return;
    }
    _errorFrontDNI.value = null;
    return;
  }

  void setBackLicense(Uint8List? value) {
    _backDNI.value = value;

    if (value == null) {
      _errorBackDNI.value =
          'La foto posterior de la identificación es requerida';
      return;
    }
    _errorBackDNI.value = null;
    return;
  }
  // ------------------------------------------------------------

  bool get isValid {
    return _errorDniNumber.value == null &&
        _errorFrontDNI.value == null &&
        _errorBackDNI.value == null;
  }

  bool get isLoading => _isLoading.value;

  // ------------------------------------------------------------
  void save() async {
    _isLoading.value = false;
    if (isValid) {
      _isLoading.value = true;
      final useCase = getIt<ISendDNISectionUseCase>();
      final request = SendDNISectionRequest(
        dni: dniNumber,
        dniFrontImage: frontDNI!,
        dniBackImage: backDNI!,
        userUuid: Get.find<SessionCtrl>().user!.uuid,
      );
      final dniSection = await useCase.call(request);
      Get.find<DriverRequestRegisterCtrl>().onUpdateDNISection(dniSection);
      _isLoading.value = false;
      Get.find<BannerCtrl>().showSuccess(
        'Operación exitosa! 🥳',
        "Se ha guardado correctamente la información de la identificación",
      );
    }
  }
}
