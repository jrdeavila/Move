import 'widgets.dart';

class ButtonClassic extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ButtonClassic({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
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
        backgroundColor: widget.color,
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
          fontWeight: FontWeight.w600,
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.02),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
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
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              widget.icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatefulWidget {
  final String text;
  final bool isPrice;
  final IconData icon;
  final Color colorIcon;
  final VoidCallback onPressed;

  const ButtonIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isPrice,
    required this.colorIcon,
  }) : super(key: key);

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.screenHeight * 0.001,
          horizontal: Dimensions.screenWidth * 0.1),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minimumSize: Size(
              Dimensions.screenWidth * 0.8, Dimensions.screenHeight * 0.06),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.colorIcon,
            ),
            Column(
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                widget.isPrice
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.01),
                        child: Text(
                          widget.text,
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
