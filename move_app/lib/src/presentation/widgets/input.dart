import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/src/presentation/utils/dimensions.dart';

class InputClassic extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumericKeyboard; // Nuevo atributo
  final List<TextInputFormatter> formatters;
  const InputClassic({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isPassword,
    required this.isNumericKeyboard,
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
}

class InputCode extends StatefulWidget {
  final TextEditingController controller;

  const InputCode({super.key, required this.controller});

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.04),
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
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.screenWidth * 0.001,
            bottom: Dimensions.screenHeight * 0.01),
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
