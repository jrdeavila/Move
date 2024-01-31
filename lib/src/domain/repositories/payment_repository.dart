import 'package:mevo/lib.dart';

abstract class IPaymentRepository {
  Future<List<Payment>> get();
}
