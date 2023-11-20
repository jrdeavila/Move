import 'package:move_app/lib.dart';

class RechargeAccount extends StatelessWidget {
  const RechargeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerConfirmationPhone = TextEditingController();
    TextEditingController controllerPrice = TextEditingController();
    String typeOfPerson = 'Natural';
    String bank = 'Nequi';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const ViewAccount());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.025),
          child: Text('Recargar cuenta',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputClassic(
              labelText: 'Numero de celular',
              controller: controllerPhone,
              isPassword: false,
              isNumericKeyboard: false,
              isDateInput: false,
            ),
            InputClassic(
              labelText: 'Confirma el numero',
              controller: controllerConfirmationPhone,
              isPassword: false,
              isNumericKeyboard: false,
              isDateInput: false,
            ),
            InputClassic(
              labelText: '¿Cuanto?',
              controller: controllerPrice,
              isPassword: false,
              isNumericKeyboard: true,
              isDateInput: false,
            ),
            CustomDropdownLabel(
              options: const [
                'Natural',
                'Juridica',
              ],
              selectedOption: typeOfPerson,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  typeOfPerson = newValue;
                }
              },
              label: 'Tipo de persona',
            ),
            CustomDropdownLabel(
              options: const [
                'Nequi',
                'Bancolombia',
                'Daviplata',
                'Davivienda'
              ],
              selectedOption: bank,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  bank = newValue;
                }
              },
              label: 'Elige el banco',
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.04,
            ),
            ButtonClassic(
              text: "Recargar",
              onPressed: () {},
              color: const Color.fromRGBO(255, 198, 65, 1),
            ),
          ],
        ),
      ),
    );
  }
}
