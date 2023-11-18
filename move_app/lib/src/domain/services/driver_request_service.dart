import 'package:move_app/lib.dart';

abstract class IDNISectionService {
  Future<DNISection> getDNISection(AppUser user);
  Future<DNISection> setDNISection(AppUser user, DNISection dniSection);
}

abstract class IDriverLicenseSectionService {
  Future<DriverLicenseSection> getDriverLicenseSection(AppUser user);
  Future<DriverLicenseSection> setDriverLicenseSection(
    AppUser user,
    DriverLicenseSection driverLicenseSection,
  );
}

abstract class IAboutCarSectionService {
  Future<AboutCarSection> getAboutCarSection(AppUser user);
  Future<AboutCarSection> setAboutCarSection(
    AppUser user,
    AboutCarSection aboutCarSection,
  );
}

abstract class INoCriminalRecordSectionService {
  Future<NoCriminalRecordSection> getNoCriminalRecordSection(AppUser user);
  Future<NoCriminalRecordSection> setNoCriminalRecordSection(
    AppUser user,
    NoCriminalRecordSection noCriminalRecordSection,
  );
}

abstract class IAboutMeSectionService {
  Future<AboutMeSection> getAboutMeSection(AppUser user);
  Future<AboutMeSection> setAboutMeSection(
    AppUser user,
    AboutMeSection aboutMeSection,
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
