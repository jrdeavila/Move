import 'package:move_app/lib.dart';

SectionStatus sectionStatusFromString(String? status) {
  switch (status) {
    case "complete":
      return SectionStatus.complete;
    case "approved":
      return SectionStatus.approved;
    case "rejected":
      return SectionStatus.rejected;
    default:
      return SectionStatus.making;
  }
}

String sectionStatusToString(SectionStatus status) {
  switch (status) {
    case SectionStatus.complete:
      return "complete";
    case SectionStatus.approved:
      return "approved";
    case SectionStatus.rejected:
      return "rejected";
    default:
      return "making";
  }
}

Map<String, dynamic> dniSectionToJson(DNISection dniSection) => {
      "dni_section": {
        "dni": dniSection.dni,
        "dni_front_image": dniSection.dniFrontImage,
        "dni_back_image": dniSection.dniBackImage,
        "status": sectionStatusToString(dniSection.status),
      }
    };

DNISection dniSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return DNISection.empty();
  }

  if (json.containsKey("dni_section") == false) {
    return DNISection.empty();
  }
  return DNISection(
    dni: json["dni_section"]["dni"],
    dniFrontImage: json["dni_section"]["dni_front_image"],
    dniBackImage: json["dni_section"]["dni_back_image"],
    status: sectionStatusFromString(json["dni_section"]["status"]),
  );
}

Map<String, dynamic> driverLicenseSectionToJson(
    DriverLicenseSection driverLicenseSection) {
  return {
    "driver_license_section": {
      "driver_license": driverLicenseSection.driverLicense,
      "driver_license_front_image":
          driverLicenseSection.driverLicenseFrontImage,
      "driver_license_back_image": driverLicenseSection.driverLicenseBackImage,
      "driver_license_confirmation":
          driverLicenseSection.driverLicenseConfirmation,
      "driver_license_expiration_date":
          driverLicenseSection.driverLicenseExpirationDate,
      "status": sectionStatusToString(driverLicenseSection.status),
    }
  };
}

Map<String, dynamic> driverLicenseSectionToJson2(
    DriverLicenseSection driverLicenseSection) {
  return {
    "driver_license_section": {
      "driver_license": driverLicenseSection.driverLicense,
      "driver_license_front_image":
          driverLicenseSection.driverLicenseFrontImage,
      "driver_license_back_image": driverLicenseSection.driverLicenseBackImage,
      "driver_license_confirmation":
          driverLicenseSection.driverLicenseConfirmation,
      "driver_license_expiration_date":
          driverLicenseSection.driverLicenseExpirationDate,
      "status": driverLicenseSection.status,
    }
  };
}

DriverLicenseSection driverLicenseSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return DriverLicenseSection.empty();
  }
  if (json.containsKey("driver_license_section") == false) {
    return DriverLicenseSection.empty();
  }
  return DriverLicenseSection(
    driverLicense: json["driver_license_section"]["driver_license"],
    driverLicenseFrontImage: json["driver_license_section"]
        ["driver_license_front_image"],
    driverLicenseBackImage: json["driver_license_section"]
        ["driver_license_back_image"],
    driverLicenseConfirmation: json["driver_license_section"]
        ["driver_license_confirmation"],
    driverLicenseExpirationDate: json["driver_license_section"]
        ["driver_license_expiration_date"],
    status: sectionStatusFromString(json["driver_license_section"]["status"]),
  );
}

Map<String, dynamic> aboutCarSectionToJson(AboutCarSection aboutCarSection) {
  return {
    "about_car_section": {
      "car_brand": aboutCarSection.carBrand,
      "car_model": aboutCarSection.carModel,
      "car_plate": aboutCarSection.carPlate,
      "car_image": aboutCarSection.carImage,
      "status": sectionStatusToString(aboutCarSection.status),
    }
  };
}

AboutCarSection aboutCarSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return AboutCarSection.empty();
  }
  if (json.containsKey("about_car_section") == false) {
    return AboutCarSection.empty();
  }
  return AboutCarSection(
    carBrand: json["car_brand"],
    carModel: json["car_model"],
    carPlate: json["car_plate"],
    carImage: json["car_image"],
    status: sectionStatusFromString(json["status"]),
  );
}

Map<String, dynamic> noCriminalRecordSectionToJson(
    NoCriminalRecordSection noCriminalRecordSection) {
  return {
    "no_criminal_record": {
      "no_criminal_record_front_image":
          noCriminalRecordSection.noCriminalRecordFile,
      "status": sectionStatusToString(noCriminalRecordSection.status)
    }
  };
}

NoCriminalRecordSection noCriminalRecordSectionFromJson(
    Map<String, dynamic>? json) {
  if (json == null) {
    return NoCriminalRecordSection.empty();
  }

  if (json.containsKey("no_criminal_record_section") == false) {
    return NoCriminalRecordSection.empty();
  }

  return NoCriminalRecordSection(
    noCriminalRecordFile: json["no_criminal_record_front_image"],
    status: sectionStatusFromString(json["status"]),
  );
}

Map<String, dynamic> aboutMeSectionToJson(
  AboutMeSection aboutMeSection,
) {
  return {
    "about_me_section": {
      "first_name": aboutMeSection.firstName,
      "last_name": aboutMeSection.lastName,
      "email": aboutMeSection.email,
      "profile_image": aboutMeSection.profileImage,
      "birth_date": aboutMeSection.birthDate,
      "status": sectionStatusToString(aboutMeSection.status),
    }
  };
}

AboutMeSection aboutMeSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return AboutMeSection.empty();
  }
  if (json.containsKey("about_me_section") == false) {
    return AboutMeSection.empty();
  }
  return AboutMeSection(
    firstName: json["about_me_section"]["first_name"],
    lastName: json["about_me_section"]["last_name"],
    email: json["about_me_section"]["email"],
    profileImage: json["about_me_section"]["profile_image"],
    birthDate: json["about_me_section"]["birth_date"],
    status: sectionStatusFromString(json["about_me_section"]["status"]),
  );
}

Map<String, dynamic> soatSectionToJson(SoatSection soatSection) {
  return {
    "soat_section": {
      "soat_file": soatSection.soatFile,
      "status": sectionStatusToString(soatSection.status),
    }
  };
}

SoatSection soatSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return SoatSection.empty();
  }
  if (json.containsKey("soat_section") == false) {
    return SoatSection.empty();
  }
  return SoatSection(
    soatFile: json["soat_section"]["soat_file"],
    status: sectionStatusFromString(json["soat_section"]["status"]),
  );
}

Map<String, dynamic> technicalReviewSectionToJson(
    TechnicalReviewSection technicalReviewSection) {
  return {
    "technical_review_section": {
      "technical_review_url": technicalReviewSection.technicalReviewUrl,
      "status": sectionStatusToString(technicalReviewSection.status),
    }
  };
}

TechnicalReviewSection technicalReviewSectionFromJson(
    Map<String, dynamic>? json) {
  if (json == null) {
    return TechnicalReviewSection.empty();
  }
  if (json.containsKey("technical_review_section") == false) {
    return TechnicalReviewSection.empty();
  }
  return TechnicalReviewSection(
    technicalReviewUrl: json["technical_review_section"]
        ["technical_review_url"],
    status: sectionStatusFromString(json["technical_review_section"]["status"]),
  );
}

Map<String, dynamic> ownerShipCardSectionToJson(
    OwnerShipCardSection ownerShipCardSection) {
  return {
    "owner_ship_card_section": {
      "owner_ship_card_make_year": ownerShipCardSection.ownerShipCardMakeYear,
      "ownership_card_back_image": ownerShipCardSection.ownershipCardBackImage,
      "ownership_card_front_image":
          ownerShipCardSection.ownershipCardFrontImage,
      "status": sectionStatusToString(ownerShipCardSection.status),
    }
  };
}

OwnerShipCardSection ownerShipCardSectionFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return OwnerShipCardSection.empty();
  }
  if (json.containsKey("owner_ship_card_section") == false) {
    return OwnerShipCardSection.empty();
  }
  return OwnerShipCardSection(
    ownerShipCardMakeYear: json["owner_ship_card_section"]
        ["owner_ship_card_make_year"],
    ownershipCardBackImage: json["owner_ship_card_section"]
        ["ownership_card_back_image"],
    ownershipCardFrontImage: json["owner_ship_card_section"]
        ["ownership_card_front_image"],
    status: sectionStatusFromString(json["owner_ship_card_section"]["status"]),
  );
}

DriverRequest driverRequestFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return DriverRequest.empty();
  }
  return DriverRequest(
    userUuid: json["user_uuid"],
    dniSection: dniSectionFromJson(json),
    driverLicenseSection: driverLicenseSectionFromJson(json),
    aboutCarSection: aboutCarSectionFromJson(json),
    noCriminalRecordSection: noCriminalRecordSectionFromJson(json),
    aboutMeSection: aboutMeSectionFromJson(json),
    soatSection: soatSectionFromJson(json),
    technicalReviewSection: technicalReviewSectionFromJson(json),
    ownerShipCardSection: ownerShipCardSectionFromJson(json),
  );
}
