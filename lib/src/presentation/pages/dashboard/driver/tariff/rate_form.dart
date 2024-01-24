import 'package:move_app/lib.dart';

// ignore: must_be_immutable
class RateFormDriver extends StatefulWidget {
  final TextEditingController paymentSuggestController;
  final String priceOffered;
  final Function(bool) onVisibilityChanged;

  const RateFormDriver(
      {super.key,
      required this.paymentSuggestController,
      required this.onVisibilityChanged,
      required this.priceOffered});

  @override
  State<RateFormDriver> createState() => _RateFormDriverState();
}

class _RateFormDriverState extends State<RateFormDriver> {
  void _onFinishButtonPressed() {
    setState(() {
      widget.onVisibilityChanged(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: Container(
        width: Dimensions.screenWidth * 1,
        height: Dimensions.screenHeight * 0.55,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 236, 178, 42),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.02),
          child: Container(
            width: Dimensions.screenWidth * 1,
            height: Dimensions.screenHeight * 0.48,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.onVisibilityChanged(false);
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.screenWidth * 0.14),
                      child: Text(
                        'Ofrezca su tarifa',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomCurrencyInput(
                    controller: widget.paymentSuggestController),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.screenHeight * 0.01),
                  child: Text(
                    "Precio Ofertado: ${widget.priceOffered}",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: Dimensions.screenWidth * 0.034,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.screenWidth * 0.1,
                      right: Dimensions.screenWidth * 0.1,
                      top: Dimensions.screenHeight * 0.02),
                  child: ButtonClassic(
                    text: "Finalizar",
                    onPressed: _onFinishButtonPressed,
                    color: const Color.fromRGBO(255, 198, 65, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
