import 'package:move_app/lib.dart';

class CardClassic extends StatelessWidget {
  final String? title;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;
  final double size;

  const CardClassic({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    required this.onPressed,
    required this.size,
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

class CardService extends StatelessWidget {
  final String user;
  final String score;
  final String price;
  final String km;
  final String time;
  final String carName;
  final String license;
  final Color colorTextUser;
  final VoidCallback onPressed;
  const CardService(
      {super.key,
      required this.user,
      required this.score,
      required this.price,
      required this.km,
      required this.time,
      required this.carName,
      required this.license,
      required this.onPressed,
      required this.colorTextUser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Dimensions.screenWidth * 0.85,
        height: Dimensions.screenHeight * 0.18,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(140, 138, 142, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Dimensions.screenWidth * 0.8,
              height: Dimensions.screenHeight * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenWidth * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserClassic(
                          user: user,
                          colorText: colorTextUser,
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.01,
                        ),
                        Container(
                            width: Dimensions.screenWidth * 0.12,
                            height: Dimensions.screenHeight * 0.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(67, 67, 67, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 17,
                                  color: Color.fromRGBO(255, 193, 7, 1),
                                ),
                                Text(
                                  score,
                                  style: GoogleFonts.montserrat(
                                    fontSize: Dimensions.screenWidth * 0.028,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: Dimensions.screenHeight * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(price,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.07,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            )),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.map_rounded,
                              size: 17,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.01,
                            ),
                            Text(
                              km,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.screenWidth * 0.028,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.015,
                            ),
                            const Icon(
                              Icons.access_time_outlined,
                              size: 17,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.01,
                            ),
                            Text(
                              time,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.screenWidth * 0.028,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.screenHeight * 0.01),
                          child: SizedBox(
                            width: Dimensions.screenWidth * 0.39,
                            child: Text(carName,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: Dimensions.screenWidth * 0.038,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                )),
                          ),
                        ),
                        Container(
                          width: Dimensions.screenWidth * 0.26,
                          height: Dimensions.screenHeight * 0.035,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color.fromRGBO(140, 138, 142, 1),
                          ),
                          child: Center(
                            child: Text(license,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Dimensions.screenWidth * 0.035,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardRequest extends StatelessWidget {
  final String photo;
  final String user;
  final String price;
  final String paymentType;
  final Color colorText;
  final String initialAdress;
  final String endAdress;
  final VoidCallback onPressedAccepted;
  final VoidCallback onPressedOffer;

  const CardRequest(
      {super.key,
      required this.photo,
      required this.price,
      required this.paymentType,
      required this.onPressedAccepted,
      required this.user,
      required this.colorText,
      required this.initialAdress,
      required this.endAdress,
      required this.onPressedOffer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.screenHeight * 0.025,
        left: Dimensions.screenWidth * 0.05,
        right: Dimensions.screenWidth * 0.05,
      ),
      child: Container(
        width: Dimensions.screenWidth * 0.85,
        height: Dimensions.screenHeight * 0.23,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(169, 131, 44, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Dimensions.screenWidth * 0.86,
              height: Dimensions.screenHeight * 0.23,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 198, 65, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.02,
                    top: Dimensions.screenHeight * 0.02),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.screenHeight * 0.02,
                          right: Dimensions.screenWidth * 0.02),
                      child: UserClassic(
                        user: user,
                        colorText: colorText,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(price,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Dimensions.screenWidth * 0.06,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                )),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.03,
                            ),
                            Text(paymentType,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Dimensions.screenWidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.place,
                              size: 25,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.02,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.47,
                              child: Text(initialAdress,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Dimensions.screenWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.map_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.02,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.47,
                              child: Text(endAdress,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Dimensions.screenWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonSmall(
                              text: 'Aceptar',
                              onPressed: onPressedAccepted,
                              color: const Color.fromRGBO(169, 131, 44, 1),
                              colorText: Colors.white,
                              width: Dimensions.screenWidth * 0.26,
                              height: Dimensions.screenHeight * 0.04,
                            ),
                            SizedBox(
                              width: Dimensions.screenWidth * 0.02,
                            ),
                            ButtonSmall(
                              text: 'Ofertar',
                              onPressed: onPressedOffer,
                              color: const Color.fromRGBO(169, 131, 44, 1),
                              colorText: Colors.white,
                              width: Dimensions.screenWidth * 0.26,
                              height: Dimensions.screenHeight * 0.04,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
