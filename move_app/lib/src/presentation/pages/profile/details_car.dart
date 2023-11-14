import 'profile.dart';

class DetailsCar extends StatefulWidget {
  const DetailsCar({super.key});

  @override
  State<DetailsCar> createState() => _DetailsCarState();
}

class _DetailsCarState extends State<DetailsCar> {
  TextEditingController controllerCarBrand = TextEditingController();
  TextEditingController controllerCarColor = TextEditingController();
  TextEditingController controllerLicense = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const Profiles());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.1),
          child: Text('Detalles Vehiculo',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width10,
              vertical: Dimensions.screenHeight * 0.03),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.03,
                ),
                InputClassic(
                  labelText: 'Marca',
                  controller: controllerCarBrand,
                  isPassword: false,
                  isNumericKeyboard: false,
                ),
                InputClassic(
                  labelText: 'Color',
                  controller: controllerCarColor,
                  isPassword: false,
                  isNumericKeyboard: false,
                ),
                InputClassic(
                  labelText: 'Placa',
                  controller: controllerLicense,
                  isPassword: false,
                  isNumericKeyboard: true,
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.04,
                ),
                ButtonClassic(
                  text: "Guardar",
                  onPressed: () {},
                  color: const Color.fromRGBO(255, 198, 65, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
