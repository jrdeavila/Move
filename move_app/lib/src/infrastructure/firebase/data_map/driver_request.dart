import 'package:move_app/lib.dart';

Map<String, dynamic> dniSectionToJson(DNISection dniSection) => {
      "dni_section": {
        "dni": dniSection.dni,
        "dni_front_image": dniSection.dniFrontImage,
        "dni_back_image": dniSection.dniBackImage,
        "checked": dniSection.checked,
      }
    };

DNISection dniSectionFromJson(Map<String, dynamic> json) => DNISection(
      dni: json["dni"],
      dniFrontImage: json["dni_front_image"],
      dniBackImage: json["dni_back_image"],
      checked: json["checked"],
    );

Map<String, dynamic> driverLicenseSectionToJson(
    DriverLicenseSection driverLicenseSection) {
  return {
    "driver_license": {
      "driver_license": driverLicenseSection.driverLicense,
      "driver_license_front_image":
          driverLicenseSection.driverLicenseFrontImage,
      "driver_license_back_image": driverLicenseSection.driverLicenseBackImage,
      "driver_license_confirmation":
          driverLicenseSection.driverLicenseConfirmation,
      "driver_license_expiration_date":
          driverLicenseSection.driverLicenseExpirationDate,
      "checked": driverLicenseSection.checked,
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
      "checked": driverLicenseSection.checked,
    }
  };
}

DriverLicenseSection driverLicenseSectionFromJson(Map<String, dynamic> json) {
  return DriverLicenseSection(
    driverLicense: json["driver_license"],
    driverLicenseFrontImage: json["driver_license_front_image"],
    driverLicenseBackImage: json["driver_license_back_image"],
    driverLicenseConfirmation: json["driver_license_confirmation"],
    driverLicenseExpirationDate: json["driver_license_expiration_date"],
    checked: json["checked"],
  );
}

Map<String, dynamic> aboutCarSectionToJson(AboutCarSection aboutCarSection) {
  return {
    "about_car": {
      "car_brand": aboutCarSection.carBrand,
      "car_plate": aboutCarSection.carPlate,
      "car_image": aboutCarSection.carImage,
      "owner_ship_card_section": {
        "owner_ship_card_front_image":
            aboutCarSection.ownerShipCardSection?.ownershipCardBackImage,
        "owner_ship_card_back_image":
            aboutCarSection.ownerShipCardSection?.ownershipCardBackImage,
        "owner_ship_card_expiration_year":
            aboutCarSection.ownerShipCardSection?.ownerShipCardMakeYear
      },
      "checked": aboutCarSection.checked,
    }
  };
}

AboutCarSection aboutCarSectionFromJson(Map<String, dynamic> json) {
  return AboutCarSection(
    carBrand: json["car_brand"],
    carPlate: json["car_plate"],
    carImage: json["car_image"],
    ownerShipCardSection: OwnerShipCardSection(
      ownershipCardFrontImage: json["owner_ship_card_section"]
          ["owner_ship_card_front_image"],
      ownershipCardBackImage: json["owner_ship_card_section"]
          ["owner_ship_card_back_image"],
      ownerShipCardMakeYear: json["owner_ship_card_section"]
          ["owner_ship_card_expiration_year"],
    ),
    checked: json["checked"],
  );
}

Map<String, dynamic> noCriminalRecordSectionToJson(
    NoCriminalRecordSection noCriminalRecordSection) {
  return {
    "no_criminal_record": {
      "no_criminal_record_front_image":
          noCriminalRecordSection.noCriminalRecordFile,
      "checkd": noCriminalRecordSection.checked,
    }
  };
}

NoCriminalRecordSection noCriminalRecordSectionFromJson(
    Map<String, dynamic> json) {
  return NoCriminalRecordSection(
    noCriminalRecordFile: json["no_criminal_record"]
        ["no_criminal_record_front_image"],
    checked: json["no_criminal_record"]["checked"],
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
      "checked": aboutMeSection.checked,
    }
  };
}

AboutMeSection aboutMeSectionFromJson(Map<String, dynamic> json) {
  return AboutMeSection(
    firstName: json["about_me_section"]["first_name"],
    lastName: json["about_me_section"]["last_name"],
    email: json["about_me_section"]["email"],
    profileImage: json["about_me_section"]["profile_image"],
    birthDate: json["about_me_section"]["birth_date"],
    checked: json["about_me_section"]["checked"],
  );
}

DriverRequest driverRequestFromJson(Map<String, dynamic> json) {
  return DriverRequest(
    userUuid: json["user_uuid"],
    dniSection: dniSectionFromJson(json["dni_section"]),
    driverLicenseSection:
        driverLicenseSectionFromJson(json["driver_license_section"]),
    aboutCarSection: aboutCarSectionFromJson(json["about_car_section"]),
    noCriminalRecordSection:
        noCriminalRecordSectionFromJson(json["no_criminal_record_section"]),
    aboutMeSection: aboutMeSectionFromJson(json["about_me_section"]),
  );
}
