import 'automobile.dart';

class AutomobileInformation extends StatefulWidget {
  const AutomobileInformation({super.key});

  @override
  State<AutomobileInformation> createState() => _AutomobileInformationState();
}

class _AutomobileInformationState extends State<AutomobileInformation> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InputDownload(
          title: 'Tarjeta de propiedad',
          root: 'assets/images/property_card.png',
          onPressed: () {
            setState(() {});
          },
          width: 90,
          height: 80,
        ),
        InputDownload(
          title: 'SOAT',
          root: 'assets/images/soat.png',
          onPressed: () {},
          width: 80,
          height: 70,
        ),
        InputDownload(
          title: 'Tecnomecanica',
          root: 'assets/images/technomechanical.png',
          onPressed: () {},
          width: 80,
          height: 70,
        ),
        InputDownload(
          title: 'Foto frontal y trasera',
          root: 'assets/images/photo_car.png',
          onPressed: () {},
          width: 85,
          height: 100,
        ),
      ],
    );
  }
}
