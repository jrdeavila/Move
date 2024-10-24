import 'package:move_app/lib.dart';

class ButtonClassic extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(Dimensions.width90, Dimensions.buttonHeight),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: Dimensions.screenWidth * 0.05,
          letterSpacing: 1.6,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ButtonBorderClassic extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;

  const ButtonBorderClassic({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // primary: Colors.white,
        // onPrimary: borderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor, width: 4),
        ),
        minimumSize: Size(Dimensions.width90, Dimensions.buttonHeight),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: borderColor,
          fontSize: Dimensions.screenWidth * 0.05,
          letterSpacing: 1.6,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ButtonClassicSmall extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ButtonClassicSmall({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize:
            Size(Dimensions.screenWidth * 0.37, Dimensions.buttonHeight),
      ),
      child: Text(
        text,
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

class ButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double width;
  final double height;
  const ButtonSmall({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.colorText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(width, height),
        elevation: 0.0,
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: colorText,
          fontSize: Dimensions.screenWidth * 0.034,
          letterSpacing: 1.6,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.02),
      child: TextButton(
        onPressed: onPressed,
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
              text,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.screenHeight * 0.001,
          horizontal: Dimensions.screenWidth * 0.1),
      child: TextButton(
        onPressed: onPressed,
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
              icon,
              color: colorIcon,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                isPrice
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.01),
                        child: Text(
                          text,
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
