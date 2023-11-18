import 'package:move_app/lib.dart';

class PersonalData extends StatelessWidget {
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerBirthDate;
  const PersonalData(
      {super.key,
      required this.controllerFirstName,
      required this.controllerLastName,
      required this.controllerEmail,
      required this.controllerBirthDate});

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputClassic(
          labelText: 'Primer Nombre',
          controller: controllerFirstName,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Primer Apellido',
          controller: controllerLastName,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Correo',
          controller: controllerEmail,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Fecha nacimiento',
          controller: controllerBirthDate,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: true,
        ),
        ButtonSmall(
          text: 'Foto',
          onPressed: () {},
          color: Colors.blue,
          colorText: Colors.white,
        )
      ],
    ));
  }
}
