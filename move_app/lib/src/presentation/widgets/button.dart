import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/src/presentation/utils/dimensions.dart';

class ButtonClassic extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonClassic({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonClassic> createState() => _ButtonClassicState();
}

class _ButtonClassicState extends State<ButtonClassic> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(Dimensions.width90, Dimensions.buttonHeight),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: Dimensions.screenWidth * 0.05,
          letterSpacing: 1.6,
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 179, 174, 174),
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Icon(
            widget.icon,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
