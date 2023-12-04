import 'package:intl/intl.dart';

String doubleCurrencyFormatter(double value) {
  final formatter = NumberFormat.currency(
    customPattern: "COP #,##0.00",
    decimalDigits: 0,
  );

  return formatter.format(value);
}

String doubleCurrencyFormatterWithoutSign(double value) {
  final formatter = NumberFormat.currency(
    customPattern: "#,##0.00",
    decimalDigits: 0,
  );

  return formatter.format(value);
}
