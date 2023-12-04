import 'package:move_app/lib.dart';

abstract class IPaymentRepository {
  Future<List<Payment>> get();
}
