import 'dart:ui';
import 'request.dart';

class RequestService extends StatefulWidget {
  const RequestService({Key? key}) : super(key: key);

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  TextEditingController controllerInitialLocation = TextEditingController();
  TextEditingController controllerFinalLocation = TextEditingController();
  final TextEditingController paymentController = TextEditingController();
  static const LatLng _pGooglePlex =
      LatLng(10.480301856994629, -73.26976776123047);
  bool isRateFormVisible = false;
  String option = 'nequi';

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
    } else {}
  }

  Widget rateForm() {
    return Positioned(
      top: Dimensions.screenHeight * 0.6,
      child: FadeInUpBig(
        child: Container(
          width: Dimensions.screenWidth * 1,
          height: Dimensions.screenHeight * 0.55,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.screenHeight * 0.02,
                    bottom: Dimensions.screenHeight * 0.002),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isRateFormVisible = false;
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Dimensions.screenWidth * 0.14),
                      child: Text('Ofrezca su tarifa',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: Dimensions.screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          )),
                    ),
                  ],
                ),
              ),
              CustomCurrencyInput(controller: paymentController),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.screenHeight * 0.01),
                child: Text(
                  'tarifa recomendada COP',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.034,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.01),
                child: Container(
                  width: Dimensions.screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: option,
                    onChanged: (String? newValue) {
                      setState(() {
                        option = newValue!;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: Dimensions.screenWidth * 0.06,
                    ),
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    items: <String>[
                      'nequi',
                      'bancolombia',
                      'daviplata',
                      'davivienda'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.screenWidth * 0.06),
                          child: Text(
                            value,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.04,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.1,
                    right: Dimensions.screenWidth * 0.1,
                    top: Dimensions.screenHeight * 0.02),
                child: ButtonClassic(
                  text: "Finalizar",
                  onPressed: () {},
                  color: const Color.fromRGBO(255, 198, 65, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Dimensions.screenHeight * 1,
        child: Stack(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.7,
              width: Dimensions.screenWidth * 1,
              child: const GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _pGooglePlex, zoom: 14),
              ),
            ),
            Positioned(
              top: Dimensions.screenHeight * 0.05,
              left: Dimensions.screenWidth * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    Get.offAll(() => const DashboardClient());
                  },
                  icon: const Icon(Icons.sort_rounded, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.screenHeight * 0.6,
              child: Container(
                width: Dimensions.screenWidth * 1,
                height: Dimensions.screenHeight * 0.55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: Dimensions.screenHeight * 0.03),
                      child: InputIcon(
                        title: 'Origen',
                        colorIcon: Colors.blue,
                        icon: Icons.album,
                        controller: controllerInitialLocation,
                        isNumericKeyboard: false,
                      ),
                    ),
                    InputIcon(
                      title: 'Destino',
                      colorIcon: const Color.fromRGBO(255, 198, 65, 1),
                      icon: Icons.album,
                      controller: controllerFinalLocation,
                      isNumericKeyboard: false,
                    ),
                    ButtonIcon(
                      icon: Icons.attach_money,
                      text: 'Precio sugerido',
                      onPressed: () {
                        setState(() {
                          isRateFormVisible = true;
                        });
                      },
                      isPrice: false,
                      colorIcon: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.screenWidth * 0.1,
                          right: Dimensions.screenWidth * 0.1,
                          top: Dimensions.screenHeight * 0.02),
                      child: ButtonClassic(
                        text: "Solicitar auto",
                        onPressed: () {},
                        color: const Color.fromRGBO(255, 198, 65, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isRateFormVisible)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.grey.withOpacity(0.4),
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            isRateFormVisible ? rateForm() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
