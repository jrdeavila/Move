enum DriverRequestStatus {
  making,
  sended,
  approved,
  finalized,
  rejected,
}

// ------------------ DriverRequest ------------------

class DriverRequest {
  final String? userUuid;
  final DNISection dniSection;
  final DriverLicenseSection driverLicenseSection;
  final AboutCarSection aboutCarSection;
  final NoCriminalRecordSection noCriminalRecordSection;
  final AboutMeSection aboutMeSection;

  DriverRequestStatus status;

  DriverRequest({
    required this.userUuid,
    required this.dniSection,
    required this.driverLicenseSection,
    required this.aboutCarSection,
    required this.noCriminalRecordSection,
    required this.aboutMeSection,
    this.status = DriverRequestStatus.making,
  });

  factory DriverRequest.empty() => DriverRequest(
        userUuid: null,
        dniSection: DNISection.empty(),
        driverLicenseSection: DriverLicenseSection.empty(),
        aboutCarSection: AboutCarSection.empty(),
        noCriminalRecordSection: NoCriminalRecordSection.empty(),
        aboutMeSection: AboutMeSection.empty(),
      );

  bool get isMaking => status == DriverRequestStatus.making;

  // ------------------ Status Callbacks ------------------

  void setSended() {
    List<bool> allSectionsChecked = [
      dniSection.checked,
      driverLicenseSection.checked,
      aboutCarSection.checked,
      noCriminalRecordSection.checked,
      aboutMeSection.checked,
    ];
    bool allSectionsAreChecked = allSectionsChecked.every((element) => element);

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
  final bool checked;

  DriverRequestSection({
    required this.title,
    this.description,
    this.checked = false,
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
    bool checked = false,
  }) : super(
          title: "Documento de Identidad",
          description: null,
          checked: checked,
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
  final DateTime? driverLicenseExpirationDate;
  final String? driverLicenseConfirmation;

  DriverLicenseSection({
    required this.driverLicense,
    required this.driverLicenseFrontImage,
    required this.driverLicenseBackImage,
    required this.driverLicenseExpirationDate,
    required this.driverLicenseConfirmation,
    bool checked = false,
  }) : super(
          title: "Licencia de Conducir",
          description: null,
          checked: checked,
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
  final String? carPlate;
  final String? carImage;
  final OwnerShipCardSection? ownerShipCardSection;

  AboutCarSection({
    required this.carBrand,
    required this.carPlate,
    required this.carImage,
    required this.ownerShipCardSection,
    bool checked = false,
  }) : super(
          title: "Sobre el Vehículo",
          description: "Agrega la información detallada de tu vehículo",
          checked: checked,
        );

  factory AboutCarSection.empty() => AboutCarSection(
        carBrand: null,
        carPlate: null,
        carImage: null,
        ownerShipCardSection: null,
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
    bool checked = false,
  }) : super(
          title: "Tarjeta de Propiedad",
          description: "Agrega la información detallada de tu vehículo",
          checked: checked,
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
    bool checked = false,
  }) : super(
          title: "Carta de Antecedentes Penales",
          description: null,
          checked: checked,
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
  final DateTime? birthDate;

  AboutMeSection({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.profileImage,
    bool checked = false,
  }) : super(
          title: "Información Personal",
          description: null,
          checked: checked,
        );

  factory AboutMeSection.empty() => AboutMeSection(
        firstName: null,
        lastName: null,
        email: null,
        birthDate: null,
        profileImage: null,
      );
}
