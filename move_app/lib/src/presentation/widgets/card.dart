import 'package:move_app/lib.dart';

class CardClassic extends StatelessWidget {
  final String? title;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;

  const CardClassic({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
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
            top: Dimensions.screenHeight * 0.07,
            left: Dimensions.screenWidth * 0.12,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.12,
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

  const CardDescription({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    this.description,
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
              width: Dimensions.width40,
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
            top: Dimensions.screenHeight * 0.095,
            left: Dimensions.screenWidth * 0.59,
            child: Image.asset(
              root!,
              width: 96,
              height: 80,
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
      required this.onPressed});

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
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.01,
                        ),
                        Text(user,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            )),
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
