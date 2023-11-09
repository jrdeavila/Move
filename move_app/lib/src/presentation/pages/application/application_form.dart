import 'application.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  bool showFirstListView = true;
  String title = 'Informacion personal';

  void toggleListView() {
    setState(() {
      showFirstListView = !showFirstListView;
      title = showFirstListView ? 'Informacion personal' : 'Datos del vehiculo';
    });
  }

  Widget buildPersonalInfoListView() {
    return ListView(
      children: [
        InputDownload(
          title: 'CC',
          root: 'assets/images/cc.png',
          onPressed: () {},
          width: 80,
          height: 70,
        ),
        InputDownload(
          title: 'Foto tipo carnet',
          root: 'assets/images/photo.png',
          onPressed: () {},
          width: 60,
          height: 60,
        ),
        InputDownload(
          title: 'Licencia de conducir',
          root: 'assets/images/driving_license.png',
          onPressed: () {},
          width: 80,
          height: 70,
        ),
        InputDownload(
          title: 'Certificacion cuentas bancarias',
          root: 'assets/images/account_certification.png',
          onPressed: () {},
          width: 80,
          height: 70,
        ),
        InputDownload(
          title: 'Antecedentes penales',
          root: 'assets/images/criminal_record.png',
          onPressed: () {},
          width: 80,
          height: 80,
        ),
      ],
    );
  }

  Widget buildVehicleInfoListView() {
    return ListView(
      children: [
        InputDownload(
          title: 'Tarjeta de propiedad',
          root: 'assets/images/property_card.png',
          onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const DashboardClient());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.07),
          child: Text('Registro conductor',
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
            vertical: Dimensions.screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: Dimensions.screenHeight * 0.03,
              ),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.048,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.7,
              child: showFirstListView
                  ? buildPersonalInfoListView()
                  : buildVehicleInfoListView(),
            ),
            showFirstListView
                ? ButtonClassic(
                    text: "Siguiente",
                    onPressed: toggleListView,
                    color: const Color.fromRGBO(255, 198, 65, 1),
                  )
                : ButtonClassic(
                    text: "Finalizar",
                    onPressed: () {},
                    color: const Color.fromRGBO(255, 198, 65, 1),
                  ),
          ],
        ),
      ),
    );
  }
}
