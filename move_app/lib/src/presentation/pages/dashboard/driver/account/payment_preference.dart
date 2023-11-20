import 'package:move_app/lib.dart';

class PaymentPreference extends StatefulWidget {
  const PaymentPreference({super.key});

  @override
  State<PaymentPreference> createState() => _PaymentPreferenceState();
}

class _PaymentPreferenceState extends State<PaymentPreference> {
  int _selectedOption = 0;

  List<String> options = ['Nequi', 'Bancolombia', 'Daviplata', 'Davivienda'];
  @override
  Widget build(BuildContext context) {
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
          children: [
            Text('Personaliza tus pagos: Elige tus favoritos en un clic.',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                )),
            Column(
              children: options
                  .asMap()
                  .entries
                  .map(
                    (entry) => RadioListTile(
                      title: Text(
                        entry.value,
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.screenWidth * 0.04,
                        ),
                      ),
                      value: entry.key,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            ButtonClassic(
              text: "Guardar",
              onPressed: () {},
              color: const Color.fromRGBO(255, 198, 65, 1),
            ),
          ],
        ),
      ),
    );
  }
}
