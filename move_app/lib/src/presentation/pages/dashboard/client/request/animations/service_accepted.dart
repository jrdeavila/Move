import 'package:move_app/lib.dart';

class ServiceAcceptedPage extends StatelessWidget {
  const ServiceAcceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
        child: Container(
      width: Dimensions.screenWidth * 1,
      height: Dimensions.screenHeight * 0.55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.screenHeight * 0.035,
              bottom: Dimensions.screenHeight * 0.02,
            ),
            child: Row(
              children: [
                const UserProfile(
                  user: 'Pedro Miguel',
                  score: '4,5',
                  colorText: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.screenWidth * 0.6,
                      child: Text('Su movil llegara aproximadamente en 3 min',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: Dimensions.screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          )),
                    ),
                    Text('Negro Kia Picanto',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        )),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Dimensions.screenHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Dimensions.screenWidth * 0.26,
                            height: Dimensions.screenHeight * 0.035,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromRGBO(140, 138, 142, 1),
                            ),
                            child: Center(
                              child: Text('IOZ320',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: Dimensions.screenWidth * 0.035,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.screenWidth * 0.03),
                            child: Text('COP 3000',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: Dimensions.screenWidth * 0.045,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const CardDetails(
            color: Colors.blue,
            adress: "Calle 10 # 10 - 10",
            title: 'Origen',
          ),
          const CardDetails(
            color: Color.fromRGBO(255, 198, 65, 1),
            adress: "Calle 10 # 10 - 10",
            title: 'Destino',
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.1,
                right: Dimensions.screenWidth * 0.1,
                top: Dimensions.screenHeight * 0.01),
            child: ButtonClassic(
              text: "Cancelar",
              onPressed: () {},
              color: const Color.fromRGBO(224, 26, 25, 1),
            ),
          ),
        ],
      ),
    ));
  }
}
