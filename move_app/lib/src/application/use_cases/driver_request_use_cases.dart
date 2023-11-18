import 'package:injectable/injectable.dart';
import 'package:move_app/src/src.dart';

// --------------------------- PERSONAL INFO SECTION ---------------------------

@Injectable(as: ISendAboutMeSectionUseCase)
class SendAboutMeSectionUseCase implements ISendAboutMeSectionUseCase {
  final IAboutMeSectionService _aboutMeSectionService;
  final IUploadFile _uploadFile;
  final IUserRepository _userService;

  SendAboutMeSectionUseCase({
    required IAboutMeSectionService aboutMeSectionService,
    required IUserRepository userService,
    required IUploadFile uploadFile,
  })  : _aboutMeSectionService = aboutMeSectionService,
        _userService = userService,
        _uploadFile = uploadFile;

  @override
  Future<AboutMeSection> call(SendAboutMeSectionRequest request) async {
    final user = await _userService.getUser(request.userUuid);
    final profileImageUrl = await _uploadFile.uploadFileBytes(
      request.profileImage,
      "driver_request/${user.uuid}/profile_image.jpg",
    );

    final aboutMeSection = AboutMeSection(
      firstName: request.firstname,
      lastName: request.lastname,
      email: request.email,
      birthDate: request.birthDate,
      profileImage: profileImageUrl,
      status: SectionStatus.complete,
    );

    return _aboutMeSectionService.setAboutMeSection(
      user,
      aboutMeSection,
    );
  }
}

// -------------------------------- DNI SECTION --------------------------------

@Injectable(as: ISendDNISectionUseCase)
class SendDNISectionUseCase implements ISendDNISectionUseCase {
  final IDNISectionService _dniSectionService;
  final IUserRepository _userService;
  final IUploadFile _uploadFile;

  SendDNISectionUseCase({
    required IDNISectionService dniSectionService,
    required IUserRepository userService,
    required IUploadFile uploadFile,
  })  : _dniSectionService = dniSectionService,
        _userService = userService,
        _uploadFile = uploadFile;

  @override
  Future<DNISection> call(SendDNISectionRequest request) async {
    final user = await _userService.getUser(request.userUuid);

    final frontImageUrl = await _uploadFile.uploadFileBytes(
      request.dniFrontImage,
      "driver_request/${user.uuid}/dni_front_image.jpg",
    );

    final backImageUrl = await _uploadFile.uploadFileBytes(
      request.dniBackImage,
      "driver_request/${user.uuid}/dni_back_image.jpg",
    );

    final dniSection = DNISection(
      dni: request.dni,
      dniFrontImage: frontImageUrl,
      dniBackImage: backImageUrl,
    );

    return _dniSectionService.setDNISection(
      user,
      dniSection,
    );
  }
}

// --------------------------- DRIVER LICENSE SECTION ---------------------------

@Injectable(as: ISendDriverLicenseSectionUseCase)
class SendDriverLicenseSectionUseCase
    implements ISendDriverLicenseSectionUseCase {
  final IDriverLicenseSectionService _driverLicenseSectionService;
  final IUserRepository _userService;
  final IUploadFile _uploadFile;

  SendDriverLicenseSectionUseCase({
    required IDriverLicenseSectionService driverLicenseSectionService,
    required IUserRepository userService,
    required IUploadFile uploadFile,
  })  : _driverLicenseSectionService = driverLicenseSectionService,
        _userService = userService,
        _uploadFile = uploadFile;

  @override
  Future<DriverLicenseSection> call(
      SendDriverLicenseSectionRequest request) async {
    final user = await _userService.getUser(request.userUuid);
    final frontImageUrl = await _uploadFile.uploadFileBytes(
      request.driverLicenseFrontImage,
      "driver_request/${user.uuid}/driver_license_front_image.jpg",
    );

    final backImageUrl = await _uploadFile.uploadFileBytes(
      request.driverLicenseBackImage,
      "driver_request/${user.uuid}/driver_license_back_image.jpg",
    );

    final confirmationImageUrl = await _uploadFile.uploadFileBytes(
      request.driverLicenseConfirmation,
      "driver_request/${user.uuid}/driver_license_confirmation.jpg",
    );

    final driverLicenseSection = DriverLicenseSection(
      driverLicense: request.driverLicense,
      driverLicenseFrontImage: frontImageUrl,
      driverLicenseBackImage: backImageUrl,
      driverLicenseConfirmation: confirmationImageUrl,
      driverLicenseExpirationDate: request.driverLicenseExpirationDate,
    );

    return _driverLicenseSectionService.setDriverLicenseSection(
      user,
      driverLicenseSection,
    );
  }
}

// ----------------------------- VEHICLE SECTION ------------------------------

@Injectable(as: ISendAboutCarSectionUseCase)
class SendAboutCarSectionUseCase implements ISendAboutCarSectionUseCase {
  final IAboutCarSectionService _aboutCarSectionService;
  final IUserRepository _userService;
  final IUploadFile _uploadFile;

  SendAboutCarSectionUseCase({
    required IAboutCarSectionService aboutCarSectionService,
    required IUserRepository userService,
    required IUploadFile uploadFile,
  })  : _aboutCarSectionService = aboutCarSectionService,
        _userService = userService,
        _uploadFile = uploadFile;

  @override
  Future<AboutCarSection> call(SendAboutCarSectionRequest request) async {
    final user = await _userService.getUser(request.userUuid);

    final carImageUrl = await _uploadFile.uploadFileBytes(
      request.carImage,
      "driver_request/${user.uuid}/car_image.jpg",
    );

    final aboutCarSection = AboutCarSection(
      carBrand: request.carBrand,
      carPlate: request.carPlate,
      carImage: carImageUrl,
    );

    return _aboutCarSectionService.setAboutCarSection(
      user,
      aboutCarSection,
    );
  }
}

// ----------------------------- NO CRIMINAL RECORD SECTION ------------------------------

@Injectable(as: ISendNoCriminalRecordSectionUseCase)
class SendNoCriminalRecordSectionUseCase
    implements ISendNoCriminalRecordSectionUseCase {
  final INoCriminalRecordSectionService _noCriminalRecordSectionService;
  final IUserRepository _userService;
  final IUploadFile _uploadFile;

  SendNoCriminalRecordSectionUseCase({
    required INoCriminalRecordSectionService noCriminalRecordSectionService,
    required IUserRepository userService,
    required IUploadFile uploadFile,
  })  : _noCriminalRecordSectionService = noCriminalRecordSectionService,
        _userService = userService,
        _uploadFile = uploadFile;

  @override
  Future<NoCriminalRecordSection> call(
      SendNoCriminalRecordSectionRequest request) async {
    final user = await _userService.getUser(request.userUuid);
    final criminalRecordFileUrl = await _uploadFile.uploadFile(
      request.criminalRecord,
      "driver_request/${user.uuid}/criminal_record.pdf",
    );

    final noCriminalRecordSection =
        NoCriminalRecordSection(noCriminalRecordFile: criminalRecordFileUrl);

    return _noCriminalRecordSectionService.setNoCriminalRecordSection(
      user,
      noCriminalRecordSection,
    );
  }
}

// ----------------------------- FINISH DRIVER REQUEST ------------------------------

@Injectable(as: IFinishDriverRequestUseCase)
class FinishDriverRequestUseCase implements IFinishDriverRequestUseCase {
  final IFinishDriverRequestService _driverRequestService;
  final IUserRepository _userService;

  FinishDriverRequestUseCase({
    required IFinishDriverRequestService driverRequestService,
    required IUserRepository userService,
  })  : _driverRequestService = driverRequestService,
        _userService = userService;

  @override
  Future<DriverRequest> call(FinishDriverRequestRequest request) async {
    final user = await _userService.getUser(request.userUuid);

    return _driverRequestService.setFinishDriverRequestSection(
      user,
    );
  }
}
