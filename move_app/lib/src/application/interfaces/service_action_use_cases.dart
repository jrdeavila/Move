import 'package:move_app/lib.dart';

abstract class ISendRequestServiceUseCase {
  Future<void> sendRequestService(SendRequestServiceRequest request);
}
