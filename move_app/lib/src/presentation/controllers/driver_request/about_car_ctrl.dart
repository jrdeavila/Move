import 'package:move_app/lib.dart';

class AboutCarCtrl extends GetxController {
  // ------------------------------------------------------------

  final RxString _carBrand = ''.obs;
  final RxString _carModel = ''.obs;
  final RxString _carPlate = ''.obs;
  final Rx<Uint8List?> _carFront = Rx<Uint8List?>(null);

  // ------------------------------------------------------------

  final RxBool _isLoading = RxBool(false);

  final Rx<String?> _errorCarBrand = Rx<String?>(null);
  final Rx<String?> _errorCarModel = Rx<String?>(null);
  final Rx<String?> _errorCarPlate = Rx<String?>(null);
  final Rx<String?> _errorCarFront = Rx<String?>(null);

  // ------------------------------------------------------------

  String get carBrand => _carBrand.value;
  String get carModel => _carModel.value;
  String get carPlate => _carPlate.value;
  Uint8List? get carFront => _carFront.value;

  // ------------------------------------------------------------

  bool get isLoading => _isLoading.value;

  String? get errorCarBrand => _errorCarBrand.value;
  String? get errorCarModel => _errorCarModel.value;
  String? get errorCarPlate => _errorCarPlate.value;
  String? get errorCarFront => _errorCarFront.value;

  // ------------------------------------------------------------

  void setCarBrand(String brand) {
    _carBrand.value = brand;

    if (brand.isEmpty) {
      _errorCarBrand.value = "Campo obrigatório";
    } else {
      _errorCarBrand.value = null;
    }
  }

  void setCarModel(String model) {
    _carModel.value = model;

    if (model.isEmpty) {
      _errorCarModel.value = "Campo obrigatório";
    } else {
      _errorCarModel.value = null;
    }
  }

  void setCarPlate(String plate) {
    _carPlate.value = plate;

    if (plate.isEmpty) {
      _errorCarPlate.value = "Campo obrigatório";
    }
    if (plate.length < 6) {
      _errorCarPlate.value = "Placa inválida";
    } else {
      _errorCarPlate.value = null;
    }
  }

  void setCarFront(Uint8List? image) {
    _carFront.value = image;
    if (image == null) {
      _errorCarFront.value = "Campo obrigatório";
    } else {
      _errorCarFront.value = null;
    }
  }

  // ------------------------------------------------------------

  bool get isValid {
    return _carBrand.value.isNotEmpty &&
        _carPlate.value.isNotEmpty &&
        _carFront.value != null;
  }

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = true;
    final useCase = getIt<ISendAboutCarSectionUseCase>();
    final aboutCarSection = await useCase.call(
      SendAboutCarSectionRequest(
        userUuid: Get.find<SessionCtrl>().user!.uuid,
        carBrand: _carBrand.value,
        carModel: _carModel.value,
        carPlate: _carPlate.value,
        carImage: _carFront.value!,
      ),
    );
    Get.find<DriverRequestRegisterCtrl>().setAboutCarSection(aboutCarSection);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa! 🎉",
      "Se ha guardado la información del vehículo",
    );
    _isLoading.value = false;
  }
}
