import 'package:move_app/lib.dart';

enum StepStatus {
  making,
  complete,
  rejected,
}

StepStatus stepStatusFromSectionStatus(SectionStatus status) {
  switch (status) {
    case SectionStatus.complete:
      return StepStatus.complete;
    case SectionStatus.approved:
      return StepStatus.complete;
    case SectionStatus.rejected:
      return StepStatus.rejected;
    default:
      return StepStatus.making;
  }
}

class SectionSegment {
  final String title;
  final String? description;
  StepStatus status;
  final VoidCallback onTap;

  SectionSegment({
    required this.title,
    this.description,
    required this.onTap,
    required this.status,
  });
}

class DriverRequestRegisterCtrl extends GetxController {
  // ------------------------------------------------------------

  List<SectionSegment> get steps => [
        _driverRequest.value.aboutMeSection,
        _driverRequest.value.dniSection,
        _driverRequest.value.driverLicenseSection,
        _driverRequest.value.soatSection,
        _driverRequest.value.technicalReviewSection,
        _driverRequest.value.ownerShipCardSection,
        _driverRequest.value.aboutCarSection,
      ]
          .map((e) => SectionSegment(
                title: e.title,
                description: e.description,
                status: stepStatusFromSectionStatus(e.status),
                onTap: () =>
                    Get.toNamed(redirectBySectionClass[e.runtimeType]!),
              ))
          .toList();

  final redirectBySectionClass = {
    AboutMeSection: DriverRequestRoutes.aboutMe,
    DNISection: DriverRequestRoutes.dni,
    DriverLicenseSection: DriverRequestRoutes.license,
    SoatSection: DriverRequestRoutes.soat,
    TechnicalReviewSection: DriverRequestRoutes.technicalReview,
    OwnerShipCardSection: DriverRequestRoutes.onwerShip,
    AboutCarSection: DriverRequestRoutes.aboutCar,
  };

  // ------------------------------------------------------------
  @override
  void onReady() {
    super.onReady();
    _fetchDriverRequest();
    Get.addPages(DriverRequestRoutes.routes);
  }

  // ------------------------------------------------------------

  final Rx<DriverRequest> _driverRequest =
      Rx<DriverRequest>(DriverRequest.empty());

  // ------------------------------------------------------------

  AboutMeSection get aboutMeSection => _driverRequest.value.aboutMeSection;
  DriverLicenseSection get driverLicenseSection =>
      _driverRequest.value.driverLicenseSection;
  DNISection get dniSection => _driverRequest.value.dniSection;
  SoatSection get soatSection => _driverRequest.value.soatSection;
  TechnicalReviewSection get technicalReviewSection =>
      _driverRequest.value.technicalReviewSection;
  OwnerShipCardSection get ownerShipCardSection =>
      _driverRequest.value.ownerShipCardSection;
  AboutCarSection get aboutCarSection => _driverRequest.value.aboutCarSection;
  NoCriminalRecordSection get noCriminalRecordSection =>
      _driverRequest.value.noCriminalRecordSection;

  bool get hasAboutMeSectionComplete =>
      _driverRequest.value.aboutMeSection.status == SectionStatus.complete;

  bool get hasLicenseSectionComplete =>
      _driverRequest.value.driverLicenseSection.status ==
      SectionStatus.complete;

  bool get hasDNISectionComplete =>
      _driverRequest.value.dniSection.status == SectionStatus.complete;

  // ------------------------------------------------------------

  void _fetchDriverRequest() async {
    final driverRequest = await getIt<IFetchDriverRequestUseCase>()
        .call(FetchDriverRequestRequest(
      Get.find<SessionCtrl>().user!,
    ));
    _driverRequest.value = driverRequest;
  }

  // ------------------------------------------------------------

  void onUpdateAboutMeSection(AboutMeSection section) {
    _driverRequest.value.aboutMeSection = section;
    _driverRequest.refresh();
  }

  void onUpdateDriverLicenseSection(DriverLicenseSection section) {
    _driverRequest.value.driverLicenseSection = section;
    _driverRequest.refresh();
  }

  void onUpdateDNISection(DNISection dniSection) {
    _driverRequest.value.dniSection = dniSection;
    _driverRequest.refresh();
  }

  void onUpdateSoatSection(SoatSection soatSection) {
    _driverRequest.value.soatSection = soatSection;
    _driverRequest.refresh();
  }

  void onUpdateTechnicalReviewSection(TechnicalReviewSection soatSection) {
    _driverRequest.value.technicalReviewSection = soatSection;
    _driverRequest.refresh();
  }
}
