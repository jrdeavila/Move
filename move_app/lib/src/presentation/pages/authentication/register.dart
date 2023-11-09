import 'package:move_app/lib.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
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
                    top: Dimensions.screenHeight * 0.18,
                    left: Dimensions.screenWidth * 0.02,
                    child: Container(
                      width: Dimensions.screenWidth * 0.99,
                      height: Dimensions.screenHeight * 0.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.screenHeight * 0.05,
                            horizontal: Dimensions.screenWidth * 0.1),
                        child: Column(
                          children: [
                            Text('Registro',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: Dimensions.screenWidth * 0.07,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                )),
                            InputClassic(
                              labelText: 'Nombre',
                              controller: controllerName,
                              isPassword: false,
                              isNumericKeyboard: false,
                            ),
                            InputClassic(
                              labelText: 'Apellido',
                              controller: controllerLastName,
                              isPassword: false,
                              isNumericKeyboard: false,
                            ),
                            InputClassic(
                              labelText: 'Celular',
                              controller: controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                            ),
                            InputClassic(
                              labelText: 'Correo',
                              controller: controllerEmail,
                              isPassword: false,
                              isNumericKeyboard: false,
                            ),
                            InputClassic(
                              labelText: 'Contraseña',
                              controller: controllerPassword,
                              isPassword: true,
                              isNumericKeyboard: false,
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.02,
                            ),
                            ButtonClassic(
                              text: "Registrar",
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
