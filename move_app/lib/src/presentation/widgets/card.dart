import 'package:move_app/lib.dart';

class CardClassic extends StatelessWidget {
  final String? title;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;
  final double size;
  final double width;
  final double height;

  const CardClassic({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    required this.onPressed,
    required this.size,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.07,
            left: Dimensions.screenWidth * 0.12,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: size,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.04,
            left: Dimensions.screenWidth * 0.59,
            child: Image.asset(
              root!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double top;
  final double left;

  const CardDescription({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    this.description,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.045,
            left: Dimensions.screenWidth * 0.09,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.093,
            left: Dimensions.screenWidth * 0.09,
            child: SizedBox(
              width: Dimensions.width50,
              child: Text(description!,
                  style: GoogleFonts.montserrat(
                    color: colorTitle,
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  )),
            ),
          ),
          Positioned(
            top: top,
            left: left,
            child: Image.asset(
              root!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}

class CardCompound extends StatelessWidget {
  final String? title;
  final String? secondTitle;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;

  const CardCompound({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    this.secondTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.05,
            left: Dimensions.screenWidth * 0.12,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.07,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.09,
            left: Dimensions.screenWidth * 0.12,
            child: Text(secondTitle!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.074,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.04,
            left: Dimensions.screenWidth * 0.59,
            child: Image.asset(
              root!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}
