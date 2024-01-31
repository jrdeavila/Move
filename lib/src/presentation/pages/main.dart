import 'package:mevo/lib.dart';

class Main extends GetView<LoginCtrl> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
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
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/logo/google.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                        const SizedBox(width: 10.0),
                        Text("Ingresar",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildMessage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/logo/logo_white.png',
                width: 100.0,
                height: 100.0,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
            ],
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
          const SizedBox(height: 40.0),
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
