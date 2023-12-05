import 'package:move_app/lib.dart';

abstract class ISendRequestServiceUseCase {
  Future<void> sendRequestService(SendRequestServiceRequest request);
}

abstract class ICancelRequestServiceUseCase {
  Future<void> cancelRequestService(CancelRequestServiceRequest request);
}

abstract class IListenCurrentRequestServiceUseCase {
  Stream<RequestService?> listen(ListenCurrentRequestServiceRequest request);
}

abstract class IListenDriverLocationUseCase {
  Stream<DriverLocation?> listen(ListenDriverLocationRequest request);
}

abstract class IListenRequestServiceCounterOffersUseCase {
  Stream<List<RequestService>> listen(
      ListenRequestServiceCounterOffersRequest request);
}

abstract class ICancelCounterOfferUseCase {
  Future<void> cancelCounterOffer(CancelCounterOfferRequest request);
}

abstract class IAcceptCounterOfferUseCase {
  Future<void> acceptCounterOffer(AcceptCounterOfferRequest request);
}

//-------------------------------- Driver --------------------------------

abstract class IListenAllRequestServiceUseCase {
  Stream<List<RequestService>> listen(ListenAllRequestServiceRequest request);
}

abstract class IAcceptRequestServiceUseCase {
  Future<void> acceptRequestService(AcceptRequestServiceRequest request);
}

abstract class ISendCounterOfferUseCase {
  Future<void> sendCounterOffer(SendCounterOfferRequest request);
}

abstract class IListenCurrentRequestServiceDriverUseCase {
  Stream<RequestService?> listen(
      ListenCurrentRequestServiceDriverRequest request);
}

abstract class IUpdateProfileLocationDataUseCase {
  Future<void> updateProfileData(UpdateProfileLocationDataRequest request);
}

abstract class IFinishServiceDriverUseCase {
  Future<void> finish(FinishServiceDriverRequest request);
}

abstract class IGetServiceCommonOffertsUseCase {
  Future<List<ServiceCommonOffert>> get();
}

abstract class IMarkAsViewedRequestServiceUseCase {
  Future<void> markAsViewed(MarkAsViewedRequest request);
}
