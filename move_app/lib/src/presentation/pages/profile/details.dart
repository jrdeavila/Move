import 'package:move_app/lib.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailsCtrl detailsCtrl = Get.find();
  //-----------------------------------
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  //-----------------------------------
  @override
  void initState() {
    super.initState();
    controllerName.text = detailsCtrl.firstname;
    controllerLastName.text = detailsCtrl.lastname;
    controllerPhone.text = detailsCtrl.phone;
    controllerEmail.text = detailsCtrl.email;

    controllerName.addListener(() {
      detailsCtrl.setFirstName(controllerName.text);
    });
    controllerLastName.addListener(() {
      detailsCtrl.setLastName(controllerLastName.text);
    });
    controllerPhone.addListener(() {
      detailsCtrl.setPhone(controllerPhone.text);
    });
    controllerEmail.addListener(() {
      detailsCtrl.setEmail(controllerEmail.text);
    });
  }

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
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.16),
          child: Text('Detalles',
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
                  labelText: 'Nombre',
                  controller: controllerName,
                  isPassword: false,
                  isNumericKeyboard: false,
                ),
                InputClassic(
                  labelText: 'Apellido',
                  controller: controllerLastName,
                  isPassword: false,
                  isNumericKeyboard: false,
                ),
                InputClassic(
                  labelText: 'Celular',
                  controller: controllerPhone,
                  isPassword: false,
                  isNumericKeyboard: true,
                  formatters: [
                    PhoneInputFormatter(),
                  ],
                ),
                InputClassic(
                  labelText: 'Correo',
                  controller: controllerEmail,
                  isPassword: false,
                  isNumericKeyboard: false,
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.04,
                ),
                ButtonClassic(
                  text: "Actualizar",
                  onPressed: () {
                    detailsCtrl.updateProfile();
                  },
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
