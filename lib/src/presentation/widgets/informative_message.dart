import 'package:mevo/lib.dart';

class InformativeMessage extends StatelessWidget {
  final bool isSucess;
  final String title;
  final String description;
  const InformativeMessage(
      {super.key,
      required this.isSucess,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: const Duration(microseconds: 10),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width5, vertical: Dimensions.height2),
          child: ButtonClassic(
            text: "Siguiente",
            onPressed: () {
              Get.offAll(() => const DashboardClient());
            },
            color: isSucess
                ? const Color.fromRGBO(50, 186, 124, 1)
                : const Color.fromRGBO(224, 26, 25, 1),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isSucess
                    ? 'assets/images/success.png'
                    : 'assets/images/error.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.screenHeight * 0.015,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.07,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.width80,
                child: Text(
                  description,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.038,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
