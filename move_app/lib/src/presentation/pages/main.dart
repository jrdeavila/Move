import 'pages.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.height10),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width10),
              child: Text('A',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenHeight * 0.02,
                  left: Dimensions.width10),
              child: Text('DONDE',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenHeight * 0.02,
                  left: Dimensions.width10),
              child: Text('QUIERAS',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenHeight * 0.02,
                  left: Dimensions.width10),
              child: Text('NOSOTROS',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.14,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenHeight * 0.02,
                  left: Dimensions.width10),
              child: Text('VAMOS.',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Dimensions.screenWidth * 0.13,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Stack(
              children: [
                Container(
                    height: Dimensions.screenHeight * 0.42,
                    width: Dimensions.width90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.contain))),
                Positioned(
                  top: Dimensions.screenHeight * 0.02,
                  left: Dimensions.screenWidth * 0.1,
                  child: Text('¡Explora la ciudad\ncon nosotros!',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.065,
                        fontWeight: FontWeight.w100,
                      )),
                ),
                Positioned(
                  top: Dimensions.screenHeight * 0.11,
                  left: Dimensions.screenWidth * 0.1,
                  child: Text('¡Empecemos!',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Dimensions.screenWidth * 0.065,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Positioned(
                  top: Dimensions.screenHeight * 0.24,
                  left: Dimensions.screenWidth * 0.56,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize:
                          Size(Dimensions.width15, Dimensions.buttonHeight),
                    ),
                    child: Text("Ingresar",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.05,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
