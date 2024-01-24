import 'package:move_app/lib.dart';

PaymentType paymentTypeFromJson(String str) {
  return {
    "cash": PaymentType.cash,
    "virtual": PaymentType.virtual,
  }[str]!;
}

Payment paymentFromJson(Map<String, dynamic> json) => Payment(
      name: json["name"] as String,
      type: paymentTypeFromJson(json["type"] as String),
    );
