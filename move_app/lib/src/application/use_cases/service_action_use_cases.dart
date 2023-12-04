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
