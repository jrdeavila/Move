enum DriverRequestStatus {
  pending,
  approved,
  finalized,
  rejected,
}

class DriverRequest {
  final String? userUuid;
  final List<DriverRequestSection> sections;

  DriverRequest({
    required this.userUuid,
    required this.sections,
  });
}

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

class DNISection extends DriverRequestSection {
  final String? dni;
  final String? dniFrontImage;
  final String? dniBackImage;
  DNISection({
    required String title,
    String? description,
    required this.dni,
    required this.dniFrontImage,
    required this.dniBackImage,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}

class DriverLicenseSection extends DriverRequestSection {
  final String? driverLicense;
  final String? driverLicenseFrontImage;
  final String? driverLicenseBackImage;
  final DateTime? driverLicenseExpirationDate;
  final String? driverLicenseConfirmation;

  DriverLicenseSection({
    required String title,
    String? description,
    required this.driverLicense,
    required this.driverLicenseFrontImage,
    required this.driverLicenseBackImage,
    required this.driverLicenseExpirationDate,
    required this.driverLicenseConfirmation,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}

class AboutCarSection extends DriverRequestSection {
  final String? carBrand;
  final String? carPlate;
  final String? carImage;
  final OwnerShipCardSection? ownerShipCardSection;

  AboutCarSection({
    required String title,
    String? description,
    required this.carBrand,
    required this.carPlate,
    required this.carImage,
    required this.ownerShipCardSection,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}

class OwnerShipCardSection extends DriverRequestSection {
  final String? ownershipCardFrontImage;
  final String? ownershipCardBackImage;
  final int? ownerShipCardMakeYear;

  OwnerShipCardSection({
    required String title,
    String? description,
    required this.ownershipCardFrontImage,
    required this.ownershipCardBackImage,
    required this.ownerShipCardMakeYear,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}

class NoCriminalRecordSection extends DriverRequestSection {
  final String? noCriminalRecordImage;

  NoCriminalRecordSection({
    required String title,
    String? description,
    required this.noCriminalRecordImage,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}

class AboutMeSection extends DriverRequestSection {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImage;
  final DateTime? birthDate;

  AboutMeSection({
    required String title,
    String? description,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.profileImage,
    bool checked = false,
  }) : super(
          title: title,
          description: description,
          checked: checked,
        );
}
