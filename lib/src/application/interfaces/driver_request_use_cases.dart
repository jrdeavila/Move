import 'package:mevo/lib.dart';

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

abstract class ISendDriverRequestUseCase {
  Future<DriverRequest> call(FinishDriverRequestRequest request);
}

abstract class IFinishDriverRequestUseCase {
  Future<DriverRequest> call(FinishDriverRequestRequest request);
}

abstract class ISendSoatSectionUseCase {
  Future<SoatSection> call(SendSoatSectionRequest request);
}

abstract class ISendTechnicalReviewSectionUseCase {
  Future<TechnicalReviewSection> call(
      SendTechnicalReviewSectionRequest request);
}

abstract class ISendOwnerShipCardSectionUseCase {
  Future<OwnerShipCardSection> call(SendOwnerShipCardSectionRequest request);
}

// --------------------------- FETCHING USE CASES ---------------------------

abstract class IFetchDriverRequestUseCase {
  Future<DriverRequest> call(FetchDriverRequestRequest request);
}
