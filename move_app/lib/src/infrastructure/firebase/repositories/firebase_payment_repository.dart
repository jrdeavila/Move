import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IPaymentRepository)
class FirebasePaymentRepository implements IPaymentRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebasePaymentRepository(this._firebaseFirestore);
  @override
  Future<List<Payment>> get() {
    return _firebaseFirestore
        .collection("settings")
        .doc("payment_methods")
        .get()
        .then((value) {
      final data = value.data() as Map<String, dynamic>;
      final payments = data["methods"] as List<dynamic>;
      return payments.map((e) => paymentFromJson(e)).toList();
    });
  }
}
