import 'package:mevo/lib.dart';

abstract class IGetPaymentsUseCase {
  Future<List<Payment>> get();
}
