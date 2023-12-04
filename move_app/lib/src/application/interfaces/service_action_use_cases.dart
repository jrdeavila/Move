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
