import 'package:move_app/lib.dart';

class DriverRequestApproved extends GetView<DriverRequestRegisterCtrl> {
  const DriverRequestApproved({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<DriverRequestRegisterCtrl>();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Solicitud enviada'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 100, color: Colors.green),
              const SizedBox(height: 10),
              Text(
                '¡Felicidades!',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Tu solicitud ha sido aceptada con exito. Ahora puedes empezar a trabajar con nosotros.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ButtonClassic(
                text: "Continuar",
                onPressed: () {
                  controller.finishRequest();
                },
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          )),
        ),
      ),
    );
  }
}
