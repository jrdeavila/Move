import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isPassword = false,
    this.helpText,
    this.onControllingText,
    this.errors,
  });

  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final bool isPassword;
  final String? helpText;
  final List<String>? errors;
  final void Function(TextEditingController)? onControllingText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _visible;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _visible = widget.isPassword;
    widget.onControllingText?.call(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        keyboardType: widget.keyboardType,
        enabled: widget.onChanged != null,
        controller: _controller,
        obscureText: _visible,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Theme.of(context).colorScheme.primary)
              : null,
          suffixIcon: widget.isPassword ? _toggleVisibilityWidget() : null,
          hintText: widget.label,
          helperText: widget.helpText,
          helperMaxLines: 3,
          fillColor: Theme.of(context).colorScheme.onBackground,
          filled: true,
          border: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          errorText:
              widget.errors?.isEmpty ?? true ? null : widget.errors?.join('\n'),
        ),
      ),
    );
  }

  Widget _toggleVisibilityWidget() => GestureDetector(
        onTap: () => setState(() => _visible = !_visible),
        child: Icon(
          _visible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
}
