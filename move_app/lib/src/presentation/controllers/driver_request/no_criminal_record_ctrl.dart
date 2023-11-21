import 'dart:io';

import 'package:move_app/lib.dart';

class NoCriminalRecordCtrl extends GetxController {
  // ------------------------------------------------------------

  @override
  void onReady() {
    super.onReady();
    final noCriminalRecordSection =
        Get.find<DriverRequestRegisterCtrl>().noCriminalRecordSection;
    _noCriminalRecordUrl.value = noCriminalRecordSection.noCriminalRecordFile;
  }

  // ------------------------------------------------------------
  final Rx<String?> _noCriminalRecordUrl = Rx<String?>(null);
  final Rx<File?> _noCriminalRecordFile = Rx<File?>(null);
  final RxBool _isLoading = RxBool(false);

  // ------------------------------------------------------------

  String? get noCriminalRecordUrl => _noCriminalRecordUrl.value;
  File? get noCriminalRecordFile => _noCriminalRecordFile.value;
  bool get isLoading => _isLoading.value;

  // ------------------------------------------------------------

  void save() async {
    _isLoading.value = true;
    final sendNoCriminalRecordSectionUseCase =
        getIt<ISendNoCriminalRecordSectionUseCase>();
    final noCriminalRecordSection = await sendNoCriminalRecordSectionUseCase
        .call(SendNoCriminalRecordSectionRequest(
      criminalRecord: noCriminalRecordFile!,
      userUuid: Get.find<SessionCtrl>().user!.uuid,
    ));

    Get.find<DriverRequestRegisterCtrl>()
        .onUpdateNoCriminalRecordSection(noCriminalRecordSection);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa! 🎉",
      "Se ha guardado la información del documento de la revisión técnico mecánica.",
    );
    _isLoading.value = false;
  }

  void clearFiles() {
    _noCriminalRecordFile.value = null;
    _noCriminalRecordUrl.value = null;
  }

  void loadFile() {
    final findFileUseCase = getIt<IFindFileUseCase>();
    findFileUseCase
        .call(
          FindFileRequest(allowedExtensions: ["pdf"]),
        )
        .then((value) => _noCriminalRecordFile.value = value);
  }
}
