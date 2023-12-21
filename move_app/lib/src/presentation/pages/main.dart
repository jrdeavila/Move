import 'package:move_app/lib.dart';

class Main extends GetView<LoginCtrl> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(child: _buildMessage()),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: ElevatedButton(
                onPressed: () {
                  controller.loginWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("INGRESAR",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      const SizedBox(width: 10.0),
                      const Icon(
                        Icons.arrow_right_alt,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildMessage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "A DONDE",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          Text(
            "QUIERAS",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          Text(
            "NOSOTROS",
            style: GoogleFonts.montserrat(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "VAMOS",
            style: GoogleFonts.montserrat(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Text("¡Ingresa y explora tu ciudad con nosotros ya!",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
