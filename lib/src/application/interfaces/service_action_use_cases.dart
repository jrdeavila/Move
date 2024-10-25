import 'package:mevo/lib.dart';

abstract class ISendRequestServiceUseCase {
  Future<void> sendRequestService(SendRequestServiceRequest request);
}

abstract class ICancelRequestServiceUseCase {
  Future<void> cancelRequestService(CancelRequestServiceRequest request);
}

abstract class IListenCurrentRequestServiceUseCase {
  Stream<RequestService?> listen(ListenCurrentRequestServiceRequest request);
  Future<RequestService?> get(ListenCurrentRequestServiceRequest request);
}

abstract class IListenDriverLocationUseCase {
  Stream<DriverLocation?> listen(ListenDriverLocationRequest request);

  Future<DriverLocation?> get(
      ListenDriverLocationRequest listenDriverLocationRequest);
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

abstract class IChangeRequestServiceOfferUseCase {
  Future<void> changeRequestServiceOffer(
      ChangeRequestServiceOfferRequest request);
}

abstract class IQualifyRequestServiceUseCase {
  Future<void> qualifyService(QualifyRequestServiceRequest request);
}

abstract class IPayRequestServiceWithPointsUseCase {
  Future<void> payRequestService(PayRequestServiceWithPointsRequest request);
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
  Future<List<ServiceCommonOffer>> get(GetServiceCommonOffertsRequest request);
}

abstract class IMarkAsViewedRequestServiceUseCase {
  Future<void> markAsViewed(MarkAsViewedRequest request);
}

abstract class ICallClientUseCase {
  Future<void> call(CallClientRequest request);
}

abstract class IChatWithClientUseCase {
  Future<void> chat(ChatWithClientRequest request);
}
