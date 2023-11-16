import 'package:move_app/lib.dart';

class PersonalInformation extends StatefulWidget {
  final TextEditingController controllerDNI;
  final TextEditingController controllerDriverLicense;
  final TextEditingController controllerDriverLicenseExpirationDate;
  final TextEditingController controllerDirverLicenseConfirmation;

  const PersonalInformation({
    Key? key,
    required this.controllerDNI,
    required this.controllerDriverLicense,
    required this.controllerDriverLicenseExpirationDate,
    required this.controllerDirverLicenseConfirmation,
  }) : super(key: key);
  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool showInformationDNI = false;
  bool showInformationDriverLicense = false;
  Widget showInfoDNI() {
    return (Column(
      children: [
        InputClassic(
          labelText: 'Cedula',
          controller: widget.controllerDNI,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonClassicSmall(
              text: "Frente",
              onPressed: () {},
              color: Colors.blue,
            ),
            ButtonClassicSmall(
              text: "Atras",
              onPressed: () {},
              color: Colors.blue,
            ),
          ],
        )
      ],
    ));
  }

  Widget showInfoDriverLicense() {
    return (Column(
      children: [
        InputClassic(
          labelText: 'Numero licencia',
          controller: widget.controllerDriverLicense,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Confirmar numero',
          controller: widget.controllerDirverLicenseConfirmation,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: false,
        ),
        InputClassic(
          labelText: 'Fecha de expiración',
          controller: widget.controllerDriverLicenseExpirationDate,
          isPassword: false,
          isNumericKeyboard: false,
          isDateInput: true,
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (!showInformationDriverLicense)
          InputDownload(
            title: 'CC',
            root: 'assets/images/cc.png',
            onPressed: () {
              setState(() {
                showInformationDNI = !showInformationDNI;
              });
            },
            width: 80,
            height: 70,
          ),
        if (!showInformationDNI && !showInformationDriverLicense)
          InputDownload(
            title: 'Foto tipo carnet',
            root: 'assets/images/photo.png',
            onPressed: () {},
            width: 60,
            height: 60,
          ),
        if (!showInformationDNI)
          InputDownload(
            title: 'Licencia de conducir',
            root: 'assets/images/driving_license.png',
            onPressed: () {
              setState(() {
                showInformationDriverLicense = !showInformationDriverLicense;
              });
            },
            width: 80,
            height: 70,
          ),
        if (!showInformationDNI && !showInformationDriverLicense)
          InputDownload(
            title: 'Antecedentes penales',
            root: 'assets/images/criminal_record.png',
            onPressed: () {},
            width: 80,
            height: 80,
          ),
        showInformationDNI ? showInfoDNI() : const SizedBox(),
        showInformationDriverLicense
            ? showInfoDriverLicense()
            : const SizedBox(),
      ],
    );
  }
}
