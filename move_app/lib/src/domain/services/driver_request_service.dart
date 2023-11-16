import 'package:move_app/lib.dart';

abstract class DNISectionSectionService {
  Future<DNISection> getDNISection(AppUser user);
  Future<void> setDNISection(AppUser user, DNISection dniSection);
}

abstract class DriverLicenseSectionService {
  Future<DriverLicenseSection> getDriverLicenseSection(AppUser user);
  Future<DriverLicenseSection> setDriverLicenseSection(
    AppUser user,
    DriverLicenseSection driverLicenseSection,
  );
}

abstract class AboutCarSectionService {
  Future<AboutCarSection> getAboutCarSection(AppUser user);
  Future<AboutCarSection> setAboutCarSection(
    AppUser user,
    AboutCarSection aboutCarSection,
  );
}

abstract class NoCriminalRecordSectionService {
  Future<NoCriminalRecordSection> getNoCriminalRecordSection(AppUser user);
  Future<NoCriminalRecordSection> setNoCriminalRecordSection(
    AppUser user,
    NoCriminalRecordSection noCriminalRecordSection,
  );
}

abstract class AboutMeSectionService {
  Future<AboutMeSection> getAboutMeSection(AppUser user);
  Future<AboutMeSection> setAboutMeSection(
    AppUser user,
    AboutMeSection aboutMeSection,
  );
}
