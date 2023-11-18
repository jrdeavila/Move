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
  StepStatus status;
  final VoidCallback onTap;

  SectionSegment({
    required this.title,
    required this.onTap,
    required this.status,
  });
}

class DriverRequestRegisterCtrl extends GetxController {
  // ------------------------------------------------------------

  List<SectionSegment> get steps => [
        SectionSegment(
          title: 'Informacion Personal',
          status: stepStatusFromSectionStatus(
              _driverRequest.value.aboutMeSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.aboutMe),
        ),
        SectionSegment(
          title: 'Licencia de conducir',
          status: stepStatusFromSectionStatus(
              _driverRequest.value.driverLicenseSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.license),
        ),
        SectionSegment(
          title: "Identificacion",
          status: stepStatusFromSectionStatus(
              _driverRequest.value.dniSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.dni),
        ),
        SectionSegment(
          title: "SOAT",
          status: stepStatusFromSectionStatus(
              _driverRequest.value.soatSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.soat),
        ),
        SectionSegment(
          title: "Tecnico Mecanica",
          status: stepStatusFromSectionStatus(
              _driverRequest.value.technicalReviewSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.technicalReview),
        ),
        SectionSegment(
          title: "Tarjeta de Propiedad",
          status: stepStatusFromSectionStatus(
              _driverRequest.value.ownerShipCardSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.onwerShip),
        ),
        SectionSegment(
          title: "Informacion del Vehiculo",
          status: stepStatusFromSectionStatus(
              _driverRequest.value.aboutCarSection.status),
          onTap: () => Get.toNamed(DriverRequestRoutes.aboutCar),
        ),
      ];

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
}
