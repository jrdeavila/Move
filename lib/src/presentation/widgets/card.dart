import 'package:mevo/lib.dart';

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
  final String title;
  final String description;
  final Color? textColor;
  final Color? color;
  final String? imageAsset;
  final VoidCallback onPressed;

  const CardDescription({
    super.key,
    required this.title,
    this.textColor,
    this.color,
    required this.imageAsset,
    required this.description,
    required this.onPressed,
  }) : assert(description.length < 70);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
                Text(description,
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            imageAsset!,
            width: 80,
            height: 80,
            fit: BoxFit.scaleDown,
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
