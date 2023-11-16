import 'package:flutter/services.dart';

import 'widgets.dart';
import 'package:intl/intl.dart';

class InputClassic extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumericKeyboard;
  final bool isDateInput;
  final List<TextInputFormatter> formatters;
  const InputClassic({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isPassword,
    required this.isNumericKeyboard,
    required this.isDateInput,
    this.formatters = const [],
  }) : super(key: key);

  @override
  State<InputClassic> createState() => _InputClassicState();
}

class _InputClassicState extends State<InputClassic> {
  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType = TextInputType.text;

    if (widget.isNumericKeyboard) {
      keyboardType = TextInputType.number;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.02),
      width: Dimensions.screenWidth * 0.9,
      child: TextField(
        onTap: () {
          if (widget.isDateInput) {
            _selectDate(context);
          }
        },
        obscureText: widget.isPassword,
        cursorColor: Colors.black,
        inputFormatters: widget.formatters,
        style: GoogleFonts.montserrat(
          color: const Color.fromRGBO(30, 30, 30, 1),
        ),
        autofocus: false,
        controller: widget.controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30),
          filled: true,
          fillColor: const Color.fromRGBO(234, 234, 234, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusColor: Colors.black,
          labelText: widget.labelText,
          labelStyle: GoogleFonts.montserrat(
            fontSize: Dimensions.screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    // ignore: unrelated_type_equality_checks
    if (pickedDate != null && pickedDate != widget.controller.text) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      widget.controller.text = formattedDate;
    }
  }
}

class InputCode extends StatefulWidget {
  final TextEditingController controller;

  const InputCode({super.key, required this.controller});

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.length == 1) {
        FocusScope.of(context).nextFocus();
        return;
      }
      if (widget.controller.text.isEmpty &&
          widget.controller.selection.baseOffset == 0) {
        FocusScope.of(context).previousFocus();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.screenHeight * 0.04,
      ),
      width: Dimensions.screenWidth * 0.15,
      height: Dimensions.screenHeight * 0.09,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(6, 4),
            blurRadius: 7,
            spreadRadius: 0.03,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          cursorColor: Colors.black,
          style: GoogleFonts.montserrat(
              color: const Color.fromRGBO(30, 30, 30, 1),
              fontSize: Dimensions.screenWidth * 0.07),
          autofocus: false,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

class InputIcon extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isNumericKeyboard;
  final IconData? icon;
  final Color? colorIcon;

  const InputIcon({
    Key? key,
    required this.title,
    required this.controller,
    required this.isNumericKeyboard,
    this.icon,
    this.colorIcon,
  }) : super(key: key);

  @override
  State<InputIcon> createState() => _InputIconState();
}

class _InputIconState extends State<InputIcon> {
  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType = TextInputType.text;

    if (widget.isNumericKeyboard) {
      keyboardType = TextInputType.number;
    }

    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
      width: Dimensions.screenWidth * 0.8,
      child: TextField(
        cursorColor: Colors.black,
        style: GoogleFonts.montserrat(
          color: const Color.fromRGBO(30, 30, 30, 1),
        ),
        autofocus: false,
        controller: widget.controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30),
          filled: true,
          fillColor: const Color.fromRGBO(234, 234, 234, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusColor: Colors.black,
          labelText: widget.title,
          labelStyle: GoogleFonts.montserrat(
            fontSize: Dimensions.screenWidth * 0.04,
            color: Colors.black,
          ),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: widget.colorIcon)
              : null,
        ),
      ),
    );
  }
}

class CustomCurrencyInput extends StatelessWidget {
  final TextEditingController controller;

  const CustomCurrencyInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.15),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.black,
          fontSize: Dimensions.screenWidth * 0.08,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
        ),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.montserrat(
            fontSize: Dimensions.screenWidth * 0.06,
            color: Colors.black,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COP',
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.06,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
