import 'authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.99,
              child: Stack(
                children: [
                  Positioned(
                      top: Dimensions.screenHeight * 0.05,
                      left: Dimensions.screenWidth * 0.05,
                      child: IconButton(
                          onPressed: () {
                            Get.offAllNamed('/principal');
                          },
                          icon: const Icon(Icons.arrow_back_ios_rounded,
                              color: Colors.white))),
                  IgnorePointer(
                    child: Container(
                        height: Dimensions.screenHeight * 0.452,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/background_login.png'),
                                fit: BoxFit.contain))),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.07,
                    left: Dimensions.screenWidth * 0.4,
                    child: Container(
                        height: Dimensions.screenHeight * 0.2,
                        width: Dimensions.screenWidth * 0.2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo/logo_white.png'),
                                fit: BoxFit.contain))),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.28,
                    left: Dimensions.screenWidth * 0.02,
                    child: Container(
                      width: Dimensions.screenWidth * 0.99,
                      height: Dimensions.screenHeight * 0.7,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.screenHeight * 0.1,
                            horizontal: Dimensions.screenWidth * 0.1),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Dimensions.screenHeight * 0.04,
                              ),
                              child: Text(
                                'Ingrese su número de télefono para iniciar sesión',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: Dimensions.screenWidth * 0.065,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InputClassic(
                              labelText: 'Telefono',
                              controller: controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                              isDateInput: false,
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.02,
                            ),
                            ButtonClassic(
                              text: "Siguiente",
                              onPressed: () {
                                Get.offAll(() => const VerificationCode());
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
