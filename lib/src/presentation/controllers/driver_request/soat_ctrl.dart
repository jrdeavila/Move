import 'dart:io';

import 'package:mevo/lib.dart';

class SoatCtrl extends GetxController {
  @override
  void onReady() {
    super.onReady();
    final soatSection = Get.find<DriverRequestRegisterCtrl>().soatSection;
    _soatFileUrl.value = soatSection.soatFile;
  }

  // ------------------------------------------------------------
  final Rx<File?> _soatFile = Rx<File?>(null);
  final RxBool _isLoading = RxBool(false);
  final Rx<String?> _soatFileUrl = Rx<String?>(null);

  // ------------------------------------------------------------

  File? get soatFile => _soatFile.value;
  bool get isLoading => _isLoading.value;
  String? get soatFileUrl => _soatFileUrl.value;

  // ------------------------------------------------------------

  void setSoatFile(File? file) {
    _soatFile.value = file;
  }

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = true;
    final sendSoatSectionUseCase = getIt<ISendSoatSectionUseCase>();
    final soatSection =
        await sendSoatSectionUseCase.call(SendSoatSectionRequest(
      soatFile: soatFile!,
      userUuid: Get.find<SessionCtrl>().user!.uuid,
    ));

    Get.find<DriverRequestRegisterCtrl>().onUpdateSoatSection(soatSection);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa! 🎉",
      "Se ha guardado la información del SOAT correctamente",
    );
    _isLoading.value = false;
  }

  void loadFile() {
    final findFileUseCase = getIt<IFindFileUseCase>();
    findFileUseCase
        .call(FindFileRequest(
      allowedExtensions: ['pdf'],
    ))
        .then((value) {
      setSoatFile(value);
    });
  }

  void clearFiles() {
    _soatFile.value = null;
    _soatFileUrl.value = null;
  }
}
