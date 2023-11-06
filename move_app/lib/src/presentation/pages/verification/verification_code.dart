import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/src/presentation/pages/dashboard/client/dashboard_client.dart';
import 'package:move_app/src/presentation/utils/dimensions.dart';
import 'package:move_app/src/presentation/widgets/button.dart';
import 'package:move_app/src/presentation/widgets/input.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  int timer = 20;
  bool isTimerRunning = true;
  late Timer countdownTimer;
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  TextEditingController thirdNumber = TextEditingController();
  TextEditingController fourthNumber = TextEditingController();
  TextEditingController fifthNumber = TextEditingController();

  void startTimer() {
    if (isTimerRunning) {
      countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (this.timer <= 0) {
            isTimerRunning = false;
            countdownTimer.cancel();
          } else {
            this.timer--;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed('/principal');
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.screenHeight * 0.03,
            horizontal: Dimensions.screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Codigo de verificación',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.07,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.02),
              child: Text(
                  'Para confirmar tu identidad, te hemos enviado un código vía WhatsApp. Por favor, ingrésalo a continuación.',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputCode(
                  controller: firstNumber,
                ),
                InputCode(
                  controller: secondNumber,
                ),
                InputCode(
                  controller: thirdNumber,
                ),
                InputCode(
                  controller: fourthNumber,
                ),
                InputCode(
                  controller: fifthNumber,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
              child: Text('0:$timer',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
            InkWell(
              onTap: () {
                if (timer == 0) {
                  print('si doy click');
                }
              },
              child: Text('enviar código SMS',
                  style: GoogleFonts.montserrat(
                    color: isTimerRunning
                        ? const Color.fromRGBO(217, 217, 217, 1)
                        : Colors.black,
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.1),
              child: ButtonClassic(
                text: "Verificar",
                onPressed: () {
                  Get.offAll(() => const DashboardClient());
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
