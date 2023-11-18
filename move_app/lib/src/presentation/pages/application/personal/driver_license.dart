import 'package:move_app/lib.dart';

class DriverLicense extends StatelessWidget {
  final TextEditingController controllerDriverLicense;
  final TextEditingController controllerDriverLicenseConfirmation;
  final TextEditingController controllerDriverLicenseExpirationDate;
  const DriverLicense(
      {super.key,
      required this.controllerDriverLicense,
      required this.controllerDriverLicenseConfirmation,
      required this.controllerDriverLicenseExpirationDate});

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        InputClassic(
          labelText: 'Numero licencia',
          controller: controllerDriverLicense,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Confirmar numero',
          controller: controllerDriverLicenseConfirmation,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Fecha de expiración',
          controller: controllerDriverLicenseExpirationDate,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: true,
        ),
      ],
    ));
  }
}
