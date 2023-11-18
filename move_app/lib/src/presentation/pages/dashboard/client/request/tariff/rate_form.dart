import 'package:move_app/lib.dart';

// ignore: must_be_immutable
class RateForm extends StatefulWidget {
  final TextEditingController paymentController;
  final Function(bool) onVisibilityChanged;
  final Function(String) onPaymentChanged;

  const RateForm(
      {super.key,
      required this.paymentController,
      required this.onVisibilityChanged,
      required this.onPaymentChanged});

  @override
  State<RateForm> createState() => _RateFormState();
}

class _RateFormState extends State<RateForm> {
  void _onFinishButtonPressed() {
    setState(() {
      widget.onVisibilityChanged(false);
      String price = widget.paymentController.text;
      widget.onPaymentChanged("$price - $option");
    });
  }

  String option = 'efectivo';
  String payment = '';
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: Container(
        width: Dimensions.screenWidth * 1,
        height: Dimensions.screenHeight * 0.55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.screenHeight * 0.02,
                  bottom: Dimensions.screenHeight * 0.002),
              child: Row(
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
                    child: Text('Ofrezca su tarifa',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        )),
                  ),
                ],
              ),
            ),
            CustomCurrencyInput(controller: widget.paymentController),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.screenHeight * 0.01),
              child: Text(
                'tarifa recomendada COP',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.034,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CustomDropdown(
              options: const [
                'efectivo',
                'nequi',
                'bancolombia',
                'daviplata',
                'davivienda'
              ],
              selectedOption: option,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  option = newValue;
                }
              },
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
    );
  }
}
