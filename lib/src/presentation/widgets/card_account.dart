import 'package:mevo/lib.dart';

class CardAccount extends StatelessWidget {
  final String themeBackground;
  final String theme;
  final String price;
  final String title;
  const CardAccount(
      {super.key,
      required this.themeBackground,
      required this.theme,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    Color amber = const Color.fromRGBO(255, 193, 7, 1);
    Color blackNeutro = const Color.fromRGBO(30, 30, 30, 1);
    String rootPicture = theme == 'amber'
        ? 'assets/images/gray-details.png'
        : 'assets/images/amber-details.png';
    return Container(
      width: Dimensions.screenWidth * 0.85,
      height: Dimensions.screenHeight * 0.19,
      decoration: BoxDecoration(
        color: themeBackground == 'amber' ? amber : blackNeutro,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            left: -20,
            child: Image.asset(
              rootPicture,
              width: Dimensions.screenWidth * 0.7,
              height: Dimensions.screenHeight * 0.5,
            ),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.04,
            left: Dimensions.screenWidth * 0.24,
            child: Text(price,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: Dimensions.screenWidth * 0.1,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.1,
            left: Dimensions.screenWidth * 0.25,
            child: Text(title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: Dimensions.screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                )),
          ),
        ],
      ),
    );
  }
}
