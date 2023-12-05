import 'package:move_app/lib.dart';

abstract class IServiceActionService {
  Future<void> sendRequestService(RequestService request);
  Future<void> cancelRequestService(RequestService request);
  Stream<RequestService?> listenCurrentRequestService(AppUser clientCreator);
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
}

abstract class IServiceFinishDriverActionService {
  Future<void> finish(RequestService requestService);
}
