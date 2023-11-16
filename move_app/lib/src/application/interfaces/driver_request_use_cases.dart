import 'package:move_app/lib.dart';

abstract class ISendDNISectionUseCase {
  Future<DNISection> call(SendDNISectionRequest request);
}

abstract class ISendAboutCarSectionUseCase {
  Future<AboutCarSection> call(SendAboutCarSectionRequest request);
}

abstract class ISendDriverLicenseSectionUseCase {
  Future<DriverLicenseSection> call(SendDriverLicenseSectionRequest request);
}

abstract class ISendNoCriminalRecordSectionUseCase {
  Future<NoCriminalRecordSection> call(
      SendNoCriminalRecordSectionRequest request);
}

abstract class ISendAboutMeSectionUseCase {
  Future<AboutMeSection> call(SendAboutMeSectionRequest request);
}

abstract class IFinishDriverRequestUseCase {
  Future<DriverRequest> call(FinishDriverRequestRequest request);
}
