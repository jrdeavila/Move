import 'dart:io';
import 'dart:typed_data';

import 'package:move_app/lib.dart';

abstract class SendSectionRequest {
  final String userUuid;

  SendSectionRequest({
    required this.userUuid,
  });
}

class SendDNISectionRequest extends SendSectionRequest {
  final String dni;
  final Uint8List dniFrontImage;
  final Uint8List dniBackImage;

  SendDNISectionRequest({
    required this.dni,
    required this.dniFrontImage,
    required this.dniBackImage,
    required super.userUuid,
  });
}

class SendNoCriminalRecordSectionRequest extends SendSectionRequest {
  final File criminalRecord;

  SendNoCriminalRecordSectionRequest({
    required this.criminalRecord,
    required super.userUuid,
  });
}

class SendAboutMeSectionRequest extends SendSectionRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String birthDate;
  final Uint8List profileImage;

  SendAboutMeSectionRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.birthDate,
    required this.profileImage,
    required super.userUuid,
  });
}

class FinishDriverRequestRequest extends SendSectionRequest {
  FinishDriverRequestRequest({required super.userUuid});
}

class SendDriverLicenseSectionRequest extends SendSectionRequest {
  final Uint8List driverLicenseFrontImage;
  final Uint8List driverLicenseBackImage;
  final Uint8List driverLicenseConfirmation;
  final String driverLicenseExpirationDate;
  final String driverLicense;

  SendDriverLicenseSectionRequest({
    required this.driverLicenseFrontImage,
    required this.driverLicenseBackImage,
    required this.driverLicenseConfirmation,
    required this.driverLicenseExpirationDate,
    required this.driverLicense,
    required super.userUuid,
  });
}

class SendAboutCarSectionRequest extends SendSectionRequest {
  final String carBrand;
  final String carPlate;
  final Uint8List carImage;
  final Uint8List ownerShipCardFrontImage;
  final Uint8List ownerShipCardBackImage;
  final int ownerShipCardExpirationYear;

  SendAboutCarSectionRequest({
    required this.carBrand,
    required this.carPlate,
    required this.carImage,
    required this.ownerShipCardFrontImage,
    required this.ownerShipCardBackImage,
    required this.ownerShipCardExpirationYear,
    required super.userUuid,
  });
}

class FetchDriverRequestRequest {
  final AppUser user;

  FetchDriverRequestRequest(this.user);
}