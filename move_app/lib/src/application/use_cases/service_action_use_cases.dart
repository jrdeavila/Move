import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: ISendRequestServiceUseCase)
class SendRequestServiceUseCase implements ISendRequestServiceUseCase {
  final IServiceActionService _serviceActionService;
  final IGenerateUuid _generateUuid;

  SendRequestServiceUseCase({
    required IServiceActionService serviceActionService,
    required IGenerateUuid generateUuid,
  })  : _serviceActionService = serviceActionService,
        _generateUuid = generateUuid;
  @override
  Future<void> sendRequestService(SendRequestServiceRequest request) {
    final requestService = RequestService(
      uuid: _generateUuid.generate(),
      clientCreator: request.clientCreator,
      origin: request.origin,
      destination: request.destination,
      payment: request.payment,
      tee: request.tee,
      driver: request.driver,
    );

    return _serviceActionService.sendRequestService(requestService);
  }
}

@Injectable(as: ICancelRequestServiceUseCase)
class CancelRequestServiceUseCase implements ICancelRequestServiceUseCase {
  final IServiceActionService _serviceActionService;

  CancelRequestServiceUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> cancelRequestService(CancelRequestServiceRequest request) {
    return _serviceActionService.cancelRequestService(request.requestService);
  }
}

@Injectable(as: IListenCurrentRequestServiceUseCase)
class ListenCurrentRequestServiceUseCase
    implements IListenCurrentRequestServiceUseCase {
  final IServiceActionService _serviceActionService;

  ListenCurrentRequestServiceUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<RequestService?> listen(ListenCurrentRequestServiceRequest request) {
    return _serviceActionService.listenCurrentRequestService(request.user);
  }
}

// ------------------------------ Driver ------------------------------

@Injectable(as: IListenAllRequestServiceUseCase)
class ListenAllRequestServiceUseCase
    implements IListenAllRequestServiceUseCase {
  final IServiceDriverActionService _serviceActionService;

  ListenAllRequestServiceUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<List<RequestService>> listen(ListenAllRequestServiceRequest request) {
    return _serviceActionService.listenAllRequestService(request.driver);
  }
}

@Injectable(as: IAcceptRequestServiceUseCase)
class AcceptRequestServiceUseCase implements IAcceptRequestServiceUseCase {
  final IServiceDriverActionService _serviceActionService;

  AcceptRequestServiceUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> acceptRequestService(AcceptRequestServiceRequest request) {
    return _serviceActionService.acceptRequestService(
      request.requestService,
      request.driver,
    );
  }
}

@Injectable(as: ISendCounterOfferUseCase)
class SendCounterOfferUseCase implements ISendCounterOfferUseCase {
  final IServiceDriverActionService _serviceActionService;
  final IGenerateUuid _generateUuid;

  SendCounterOfferUseCase({
    required IServiceDriverActionService serviceActionService,
    required IGenerateUuid generateUuid,
  })  : _serviceActionService = serviceActionService,
        _generateUuid = generateUuid;
  @override
  Future<void> sendCounterOffer(SendCounterOfferRequest request) {
    final counterOffer = request.requestService;
    counterOffer.driver = request.driver;
    counterOffer.uuid = _generateUuid.generate();
    counterOffer.tee = request.counterOffer;

    return _serviceActionService.sendCounterOffer(
      request.requestService,
      counterOffer,
      request.driver,
    );
  }
}
