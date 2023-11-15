import 'package:move_app/lib.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  final Duration timer;
  final int codeDigits;
  const VerificationCode(
      {super.key, required this.timer, required this.codeDigits});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  bool _isTimerRunning = false;
  int _timerValue = 0;
  final _controller = Get.find<LoginCtrl>();

  void _startTimer() {
    Timer.periodic(
      1.seconds,
      (timer) {
        _timerValue = widget.timer.inSeconds - timer.tick;
        bool isFinished = timer.tick == widget.timer.inSeconds;
        _isTimerRunning = !isFinished;
        if (isFinished) {
          timer.cancel();
        }
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(MainRoutes.main);
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
            PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              length: 6,
              onCompleted: (value) {
                _controller.setVerificationCode(value);
                _controller.sendCode();
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
              child: Text('00:${_timerValue.toString().padLeft(2, '0')}',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
            TextButton(
              onPressed: () {
                if (!_isTimerRunning) {
                  _startTimer();
                  _controller.login();
                }
              },
              child: Text('Reenviar Código',
                  style: GoogleFonts.montserrat(
                    color: _isTimerRunning
                        ? const Color.fromRGBO(217, 217, 217, 1)
                        : Colors.black,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.1),
              child: ButtonClassic(
                text: "Verificar",
                onPressed: () {
                  _controller.sendCode();
                },
                color: Colors.black,
              ),
            )
          ],
        ),
      )),
    );
  }
}
