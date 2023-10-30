import 'package:flutter/material.dart';

class AppTxtField extends StatelessWidget {
  const AppTxtField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.initialValue,
    this.onChange,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.secondary = false,
    this.errors,
  });

  final String hintText;
  final Icon? prefixIcon;
  final bool isPassword;
  final String? initialValue;
  final Function(String)? onChange;
  final int minLines, maxLines;
  final int? maxLength;
  final bool secondary;

  final List<String>? errors;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.primary;
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      initialValue: initialValue,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChange,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: secondary
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
            : Theme.of(context).colorScheme.onBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        prefixIcon: prefixIcon,
        errorText: errors?.isEmpty ?? true ? null : errors?.join('\n'),
      ),
    );
  }
}
