import 'package:move_app/lib.dart';

abstract class IServiceActionService {
  Future<void> sendRequestService(RequestService request);
  Future<void> cancelRequestService(RequestService request);
  Stream<RequestService> listenCurrentRequestService();
}
