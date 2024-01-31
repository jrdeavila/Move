import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IGetPaymentsUseCase)
class GetPaymentsUseCase implements IGetPaymentsUseCase {
  final IPaymentRepository _paymentRepository;

  GetPaymentsUseCase(this._paymentRepository);
  @override
  Future<List<Payment>> get() {
    return _paymentRepository.get();
  }
}
