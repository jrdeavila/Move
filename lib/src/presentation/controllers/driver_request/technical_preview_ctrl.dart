import 'dart:io';

import 'package:mevo/lib.dart';

class TechnicalPreviewCtrl extends GetxController {
  // ------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    final technicalPreviewSection =
        Get.find<DriverRequestRegisterCtrl>().technicalReviewSection;

    _technicalPreviewUrl.value = technicalPreviewSection.technicalReviewUrl;
  }

  // ------------------------------------------------------------
  final Rx<String?> _technicalPreviewUrl = Rx<String?>(null);
  final Rx<File?> _technicalPreviewFile = Rx<File?>(null);
  final RxBool _isLoading = RxBool(false);

  // ------------------------------------------------------------

  String? get technicalPreviewUrl => _technicalPreviewUrl.value;
  File? get technicalPreviewFile => _technicalPreviewFile.value;
  bool get isLoading => _isLoading.value;

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = true;
    final sendTechnicalReviewSectionUseCase =
        getIt<ISendTechnicalReviewSectionUseCase>();
    final soatSection = await sendTechnicalReviewSectionUseCase
        .call(SendTechnicalReviewSectionRequest(
      technicalReviewFile: _technicalPreviewFile.value!,
      userUuid: Get.find<SessionCtrl>().user!.uuid,
    ));

    Get.find<DriverRequestRegisterCtrl>()
        .onUpdateTechnicalReviewSection(soatSection);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa! 🎉",
      "Se ha guardado la información del documento de la revisión técnico mecánica.",
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
      _technicalPreviewFile.value = value;
    });
  }

  void clearFiles() {
    _technicalPreviewFile.value = null;
    _technicalPreviewUrl.value = null;
  }
}
