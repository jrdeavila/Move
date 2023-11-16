import 'package:flutter/services.dart';

abstract class PhoneConvert {
  static String replace({
    required String numberPhone,
    String pattern = " ",
    String replace = "",
  }) {
    return numberPhone.replaceAll(pattern, replace);
  }

  static String toFirebase({
    required String numberPhone,
  }) {
    var r = replace(numberPhone: numberPhone, pattern: " ");
    return "+57$r";
  }

  static String fromFirebase({
    required String numberPhone,
  }) {
    var r = replace(numberPhone: numberPhone, pattern: "+57");
    return "${r.substring(0, 3)} ${r.substring(3, 6)} ${r.substring(6, 10)}";
  }
}

class PhoneInputFormatter extends MaskInputFormatter {
  PhoneInputFormatter() : super(mask: "xxx xxx xxxx", separator: " ");
}

class MaskInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskInputFormatter({required this.mask, required this.separator});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
