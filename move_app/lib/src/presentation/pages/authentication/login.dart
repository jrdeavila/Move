import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/src/presentation/pages/verification/verification_code.dart';
import 'package:move_app/src/presentation/utils/dimensions.dart';
import 'package:move_app/src/presentation/widgets/button.dart';
import 'package:move_app/src/presentation/widgets/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                              child: Text('Ingresar',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: Dimensions.screenWidth * 0.07,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
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
                              text: "Ingresar",
                              onPressed: () {
                                Get.offAll(() => const VerificationCode());
                              },
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.04,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed('/register');
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('¿No tienes una cuenta?',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: Dimensions.screenWidth * 0.04,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1,
                                        decoration: TextDecoration.none,
                                      )),
                                  SizedBox(
                                    width: Dimensions.screenWidth * 0.02,
                                  ),
                                  Text('Registrar',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: Dimensions.screenWidth * 0.04,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.2,
                                        decoration: TextDecoration.none,
                                      )),
                                ],
                              ),
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
