import 'package:move_app/lib.dart';

class OwnerShipCtrl extends GetxController {
  // ------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    final ownerShipCardSection =
        Get.find<DriverRequestRegisterCtrl>().ownerShipCardSection;

    imageFromNetworkImage(ownerShipCardSection.ownershipCardFrontImage)
        .then((value) => _ownerShipCardFront.value = value);
    imageFromNetworkImage(ownerShipCardSection.ownershipCardBackImage)
        .then((value) => _ownerShipCardBack.value = value);
    _ownerShipCardYearOfExpiration.value =
        ownerShipCardSection.ownerShipCardMakeYear ?? DateTime.now().year;
  }

  // ------------------------------------------------------------
  final Rx<Uint8List?> _ownerShipCardFront = Rx<Uint8List?>(null);
  final Rx<Uint8List?> _ownerShipCardBack = Rx<Uint8List?>(null);
  final RxInt _ownerShipCardYearOfExpiration = RxInt(DateTime.now().year);

  // ------------------------------------------------------------
  final RxBool _isLoading = RxBool(false);

  final Rx<String?> _errorOnwerShipNumber = Rx<String?>(null);
  final Rx<String?> _errorFrontDNI = Rx<String?>(null);
  final Rx<String?> _errorBackDNI = Rx<String?>(null);

  // ------------------------------------------------------------

  Uint8List? get ownerShipCardFront => _ownerShipCardFront.value;
  Uint8List? get ownerShipCardBack => _ownerShipCardBack.value;
  int get ownerShipCardYearOfExpiration => _ownerShipCardYearOfExpiration.value;

  // ------------------------------------------------------------

  bool get isLoading => _isLoading.value;

  String? get errorOnwerShipNumber => _errorOnwerShipNumber.value;
  String? get errorFrontDNI => _errorFrontDNI.value;
  String? get errorBackDNI => _errorBackDNI.value;

  // ------------------------------------------------------------

  void setFrontLicense(Uint8List? image) {
    _ownerShipCardFront.value = image;
  }

  void setBackLicense(Uint8List? image) {
    _ownerShipCardBack.value = image;
  }

  void setYearOfExpiration(int year) {
    _ownerShipCardYearOfExpiration.value = year;
  }

  // ------------------------------------------------------------

  bool get isValid => ownerShipCardFront != null && ownerShipCardBack != null;

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = true;
    final useCase = getIt<ISendOwnerShipCardSectionUseCase>();
    final onwerShipSection = await useCase.call(
      SendOwnerShipCardSectionRequest(
        ownerShipCardFrontImage: ownerShipCardFront!,
        ownerShipCardBackImage: ownerShipCardBack!,
        ownerShipCardExpirationYear: ownerShipCardYearOfExpiration,
        userUuid: Get.find<SessionCtrl>().user!.uuid,
      ),
    );

    Get.find<DriverRequestRegisterCtrl>()
        .onUpdateOwnerShipCardSection(onwerShipSection);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa! 🎉",
      "Se ha guardado la información del documento de la tarjeta de propiedad.",
    );

    _isLoading.value = false;
  }
}
