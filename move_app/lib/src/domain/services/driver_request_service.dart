import 'package:move_app/lib.dart';

abstract class IDNISectionService {
  Future<DNISection> setDNISection(AppUser user, DNISection dniSection);
}

abstract class IDriverLicenseSectionService {
  Future<DriverLicenseSection> setDriverLicenseSection(
    AppUser user,
    DriverLicenseSection driverLicenseSection,
  );
}

abstract class IAboutCarSectionService {
  Future<AboutCarSection> setAboutCarSection(
    AppUser user,
    AboutCarSection aboutCarSection,
  );
}

abstract class INoCriminalRecordSectionService {
  Future<NoCriminalRecordSection> setNoCriminalRecordSection(
    AppUser user,
    NoCriminalRecordSection noCriminalRecordSection,
  );
}

abstract class IAboutMeSectionService {
  Future<AboutMeSection> setAboutMeSection(
    AppUser user,
    AboutMeSection aboutMeSection,
  );
}

abstract class ISoatSectionService {
  Future<SoatSection> setSoatSection(AppUser user, SoatSection soatSection);
}

abstract class ITechnicalReviewSectionService {
  Future<TechnicalReviewSection> setTechnicalReviewSection(
    AppUser user,
    TechnicalReviewSection technicalReviewSection,
  );
}

abstract class IOwnerShipCardSectionService {
  Future<OwnerShipCardSection> setOwnerShipCardSection(
    AppUser user,
    OwnerShipCardSection ownerShipCardSection,
  );
}

abstract class IFinishDriverRequestService {
  Future<DriverRequest> setFinishDriverRequestSection(
    AppUser user,
  );
}

abstract class IGetDriverRequestService {
  Future<DriverRequest> getDriverRequest(AppUser user);
}
