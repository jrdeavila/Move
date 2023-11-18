import 'package:move_app/lib.dart';

class InformationDNI extends StatelessWidget {
  final TextEditingController controllerDNI;

  const InformationDNI({super.key, required this.controllerDNI});

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        InputClassic(
          labelText: 'Cedula',
          controller: controllerDNI,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonSmall(
              text: 'Frente',
              onPressed: () {},
              color: Colors.blue,
              colorText: Colors.white,
            ),
            ButtonSmall(
              text: 'Atras',
              onPressed: () {},
              color: Colors.blue,
              colorText: Colors.white,
            ),
          ],
        )
      ],
    ));
  }
}
