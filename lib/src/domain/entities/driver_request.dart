enum DriverRequestStatus {
  making,
  sended,
  approved,
  finalized,
  rejected,
}

enum SectionStatus {
  making,
  complete,
  approved,
  rejected,
}

// ------------------ DriverRequest ------------------

class DriverRequest {
  final String? userUuid;
  DNISection dniSection;
  DriverLicenseSection driverLicenseSection;
  AboutCarSection aboutCarSection;
  NoCriminalRecordSection noCriminalRecordSection;
  AboutMeSection aboutMeSection;
  SoatSection soatSection;
  TechnicalReviewSection technicalReviewSection;
  OwnerShipCardSection ownerShipCardSection;

  DriverRequestStatus status;

  DriverRequest({
    required this.userUuid,
    required this.dniSection,
    required this.driverLicenseSection,
    required this.aboutCarSection,
    required this.noCriminalRecordSection,
    required this.aboutMeSection,
    required this.soatSection,
    required this.technicalReviewSection,
    required this.ownerShipCardSection,
    this.status = DriverRequestStatus.making,
  });

  factory DriverRequest.empty() => DriverRequest(
        userUuid: null,
        dniSection: DNISection.empty(),
        driverLicenseSection: DriverLicenseSection.empty(),
        aboutCarSection: AboutCarSection.empty(),
        noCriminalRecordSection: NoCriminalRecordSection.empty(),
        aboutMeSection: AboutMeSection.empty(),
        soatSection: SoatSection.empty(),
        technicalReviewSection: TechnicalReviewSection.empty(),
        ownerShipCardSection: OwnerShipCardSection.empty(),
      );

  bool get isMaking => status == DriverRequestStatus.making;
  bool get isSended => status == DriverRequestStatus.sended;
  bool get isApproved => status == DriverRequestStatus.approved;
  bool get isFinalized => status == DriverRequestStatus.finalized;
  bool get isRejected => status == DriverRequestStatus.rejected;

  bool get isComplete {
    var list = [
      dniSection.status,
      driverLicenseSection.status,
      aboutMeSection.status,
      aboutCarSection.status,
      noCriminalRecordSection.status,
      aboutMeSection.status,
    ];
    return list.every((element) => element == SectionStatus.complete);
  }

  // ------------------ Status Callbacks ------------------

  void setSended() {
    List<SectionStatus> allSectionsChecked = [
      dniSection.status,
      driverLicenseSection.status,
      aboutCarSection.status,
      noCriminalRecordSection.status,
      aboutMeSection.status,
    ];
    bool allSectionsAreChecked = allSectionsChecked
        .every((element) => element == SectionStatus.complete);

    if (allSectionsAreChecked) {
      status = DriverRequestStatus.sended;
    } else {
      throw Exception("No todas las secciones están completas");
    }
  }

  void setFinished() {
    if (status == DriverRequestStatus.approved) {
      status = DriverRequestStatus.finalized;
    }
  }
}

// ------------------ DriverRequestSection Abstraction ------------------

abstract class DriverRequestSection {
  final String title;
  final String? description;
  SectionStatus status;

  DriverRequestSection({
    required this.title,
    this.description,
    this.status = SectionStatus.making,
  });
}

// ------------------ Sections ------------------

class DNISection extends DriverRequestSection {
  final String? dni;
  final String? dniFrontImage;
  final String? dniBackImage;
  DNISection({
    required this.dni,
    required this.dniFrontImage,
    required this.dniBackImage,
    super.status = SectionStatus.making,
  }) : super(
          title: "Documento de Identidad",
          description: null,
        );

  factory DNISection.empty() => DNISection(
        dni: null,
        dniFrontImage: null,
        dniBackImage: null,
      );
}

class DriverLicenseSection extends DriverRequestSection {
  final String? driverLicense;
  final String? driverLicenseFrontImage;
  final String? driverLicenseBackImage;
  final String? driverLicenseExpirationDate;
  final String? driverLicenseConfirmation;

  DriverLicenseSection({
    required this.driverLicense,
    required this.driverLicenseFrontImage,
    required this.driverLicenseBackImage,
    required this.driverLicenseExpirationDate,
    required this.driverLicenseConfirmation,
    super.status = SectionStatus.making,
  }) : super(
          title: "Licencia de Conducir",
          description: null,
        );

  factory DriverLicenseSection.empty() => DriverLicenseSection(
        driverLicense: null,
        driverLicenseFrontImage: null,
        driverLicenseBackImage: null,
        driverLicenseExpirationDate: null,
        driverLicenseConfirmation: null,
      );
}

class AboutCarSection extends DriverRequestSection {
  final String? carBrand;
  final String? carModel;
  final String? carPlate;
  final String? carImage;

  AboutCarSection({
    required this.carBrand,
    required this.carModel,
    required this.carPlate,
    required this.carImage,
    super.status = SectionStatus.making,
  }) : super(
          title: "Sobre el Vehículo",
          description: "Agrega la información detallada de tu vehículo",
        );

  factory AboutCarSection.empty() => AboutCarSection(
        carModel: null,
        carBrand: null,
        carPlate: null,
        carImage: null,
      );
}

class OwnerShipCardSection extends DriverRequestSection {
  final String? ownershipCardFrontImage;
  final String? ownershipCardBackImage;
  final int? ownerShipCardMakeYear;

  OwnerShipCardSection({
    required this.ownershipCardFrontImage,
    required this.ownershipCardBackImage,
    required this.ownerShipCardMakeYear,
    super.status = SectionStatus.making,
  }) : super(
          title: "Tarjeta de Propiedad",
          description: "Agrega la información detallada de tu vehículo",
        );

  factory OwnerShipCardSection.empty() => OwnerShipCardSection(
        ownershipCardFrontImage: null,
        ownershipCardBackImage: null,
        ownerShipCardMakeYear: null,
      );
}

class NoCriminalRecordSection extends DriverRequestSection {
  final String? noCriminalRecordFile;

  NoCriminalRecordSection({
    required this.noCriminalRecordFile,
    super.status = SectionStatus.making,
  }) : super(
          title: "Carta de Antecedentes Penales",
          description: null,
        );

  factory NoCriminalRecordSection.empty() => NoCriminalRecordSection(
        noCriminalRecordFile: null,
      );
}

class AboutMeSection extends DriverRequestSection {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImage;
  final String? birthDate;

  AboutMeSection({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.profileImage,
    super.status = SectionStatus.making,
  }) : super(
          title: "Información Personal",
          description: null,
        );

  factory AboutMeSection.empty() => AboutMeSection(
        firstName: null,
        lastName: null,
        email: null,
        birthDate: null,
        profileImage: null,
      );
}

class SoatSection extends DriverRequestSection {
  final String? soatFile;

  SoatSection({
    required this.soatFile,
    super.status = SectionStatus.making,
  }) : super(
          title: "SOAT",
          description: null,
        );

  factory SoatSection.empty() => SoatSection(
        soatFile: null,
      );
}

class TechnicalReviewSection extends DriverRequestSection {
  final String? technicalReviewUrl;

  TechnicalReviewSection({
    required this.technicalReviewUrl,
    super.status = SectionStatus.making,
  }) : super(
          title: "Revisión Técnica",
          description: null,
        );

  factory TechnicalReviewSection.empty() => TechnicalReviewSection(
        technicalReviewUrl: null,
      );
}
