import 'package:mevo/lib.dart';

abstract class IServiceActionService {
  Future<void> sendRequestService(RequestService request);
  Future<void> cancelRequestService({
    required RequestService request,
    required RequestServiceCancelReason reason,
  });
  Stream<RequestService?> listenCurrentRequestService(AppUser clientCreator);
  Future<RequestService?> getCurrentRequestService(AppUser clientCreator);
  Future<void> acceptCounterOffer(
      RequestService requestService, RequestService counterOffer);
  Stream<List<RequestService>> getRequestServiceCounterOffers(
      RequestService requestService);

  Future<void> cancelCounterOffer(
      RequestService requestService, RequestService counterOffer);
}

abstract interface class IChangeRequestServiceOfferService {
  Future<void> changeRequestServiceOffer(
      RequestService requestService, double offer);
}

// -------------------------------- Driver --------------------------------

abstract class IServiceDriverActionService {
  Stream<List<RequestService>> listenAllRequestService(AppUser driver);

  Future<void> acceptRequestService(
      RequestService requestService, AppUser driver);

  Future<void> sendCounterOffer(RequestService requestService,
      RequestService counterOffer, AppUser driver);

  Stream<RequestService?> listenCurrentRequestService(AppUser driver);
}

abstract class IGetDriverLocationService {
  Stream<DriverLocation?> listen(AppUser driver);

  Future<DriverLocation?> get(AppUser driver);
}

abstract class IPayRequestServiceWithPointsService {
  Future<void> payRequestService(RequestService requestService);
}

abstract class IServiceFinishDriverActionService {
  Future<void> finish(RequestService requestService);
}

abstract class IMarkAsViewedRequestServiceService {
  Future<void> markAsViewed(RequestService requestService, AppUser driver);
}

abstract interface class IChatWithClientService {
  Future<void> chat(AppUser client);
}

abstract interface class ICallClientService {
  Future<void> call(AppUser client);
}

abstract class IQualifyRequestServiceService {
  Future<void> qualifyService(RequestService requestService, double rating);
}
