import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/widgets/custom_dropdown.dart';

class AboutCar extends StatefulWidget {
  final TextEditingController controllerCarPlate;
  final TextEditingController controllerCarBrand;
  const AboutCar(
      {super.key,
      required this.controllerCarPlate,
      required this.controllerCarBrand});

  @override
  State<AboutCar> createState() => _AboutCarState();
}

class _AboutCarState extends State<AboutCar> {
  String selectedOption = 'toyota';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputClassic(
          labelText: 'Numero matricula',
          controller: widget.controllerCarPlate,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        CustomDropdown(
          options: const [
            'toyota',
            'fortuner',
          ],
          selectedOption: selectedOption,
          onChanged: (String? newValue) {
            if (newValue != null) {
              selectedOption = newValue;
            }
          },
        ),
      ],
    );
  }
}
