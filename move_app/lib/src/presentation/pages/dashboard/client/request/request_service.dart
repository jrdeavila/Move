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
  bool isServiceDetailVisible = false;
  bool isServiceAcceptedVisible = false;
  bool isServiceCanceledVisible = false;

  String option = 'efectivo';
  String payment = '';
  int _selectedOption = 0;

  List<String> options = [
    'Cambio de planes',
    'Demora excesiva',
    'Problema con el conductor',
    'Problema con el vehículo',
  ];

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

  Widget serviceCanceled() {
    return Positioned(
        top: Dimensions.screenHeight * 0.46,
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
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.02,
                right: Dimensions.screenWidth * 0.02,
                top: Dimensions.screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isServiceCanceledVisible = false;
                            isServiceAcceptedVisible = true;
                          });
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.screenWidth * 0.03),
                        child: Text('Cancelacion de servicio',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.055,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenWidth * 0.05,
                        vertical: Dimensions.screenHeight * 0.01),
                    child: Text(
                        '¿Por qué desea cancelar tu servicio de transporte?',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        )),
                  ),
                  Column(
                    children: options
                        .asMap()
                        .entries
                        .map(
                          (entry) => RadioListTile(
                            title: Text(
                              entry.value,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.screenWidth * 0.04,
                              ),
                            ),
                            value: entry.key,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  ButtonClassic(
                    text: "Confirmar cancelación",
                    onPressed: () {
                      setState(() {});
                    },
                    color: const Color.fromRGBO(224, 26, 25, 1),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget serviceAccepted() {
    return Positioned(
      top: Dimensions.screenHeight * 0.53,
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
                top: Dimensions.screenHeight * 0.035,
                bottom: Dimensions.screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  const UserProfile(user: 'Pedro Miguel', score: '4,5'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Dimensions.screenWidth * 0.6,
                        child: Text('Su movil llegara aproximadamente en 3 min',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            )),
                      ),
                      Text('Negro Kia Picanto',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: Dimensions.screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Dimensions.screenWidth * 0.26,
                              height: Dimensions.screenHeight * 0.035,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color.fromRGBO(140, 138, 142, 1),
                              ),
                              child: Center(
                                child: Text('IOZ320',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: Dimensions.screenWidth * 0.035,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.screenWidth * 0.03),
                              child: Text('COP ${paymentController.text}',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: Dimensions.screenWidth * 0.045,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CardDetails(
              color: Colors.blue,
              adress: controllerInitialLocation.text,
              title: 'Origen',
            ),
            CardDetails(
              color: const Color.fromRGBO(255, 198, 65, 1),
              adress: controllerInitialLocation.text,
              title: 'Destino',
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.1,
                  right: Dimensions.screenWidth * 0.1,
                  top: Dimensions.screenHeight * 0.01),
              child: ButtonClassic(
                text: "Cancelar",
                onPressed: () {
                  setState(() {
                    isServiceCanceledVisible = true;
                  });
                },
                color: const Color.fromRGBO(224, 26, 25, 1),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget serviceDetails() {
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
                top: Dimensions.screenHeight * 0.035,
                bottom: Dimensions.screenHeight * 0.02,
              ),
              child: Text('Solicitando servicio',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  )),
            ),
            Text('COP ${paymentController.text}',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.06,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                )),
            CardDetails(
              color: Colors.blue,
              adress: controllerInitialLocation.text,
              title: 'Origen',
            ),
            CardDetails(
              color: const Color.fromRGBO(255, 198, 65, 1),
              adress: controllerInitialLocation.text,
              title: 'Destino',
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.1,
                  right: Dimensions.screenWidth * 0.1,
                  top: Dimensions.screenHeight * 0.01),
              child: ButtonClassic(
                text: "Cancelar",
                onPressed: () {
                  setState(() {
                    isServiceCanceledVisible = true;
                  });
                },
                color: const Color.fromRGBO(224, 26, 25, 1),
              ),
            ),
          ],
        ),
      )),
    );
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
                      'efectivo',
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
                  onPressed: () {
                    setState(() {
                      payment = '${paymentController.text} - $option';
                      isRateFormVisible = false;
                    });
                  },
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
                initialCameraPosition: CameraPosition(
                  target: _pGooglePlex,
                  zoom: 14,
                ),
                zoomControlsEnabled: false,
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
                      text: payment.isNotEmpty ? payment : 'Precio sugerido',
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
                        onPressed: () {
                          setState(() {
                            isServiceDetailVisible = true;
                          });
                        },
                        color: const Color.fromRGBO(255, 198, 65, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: Dimensions.screenHeight * 0.1,
                left: Dimensions.screenWidth * 0.19,
                child: CardService(
                  user: 'Miguel Galindo',
                  score: '4,5',
                  price: '8000',
                  km: '2,5 km',
                  time: '3 min',
                  carName: 'Negro Kia Picanto',
                  license: 'IOZ32O',
                  onPressed: () {
                    setState(() {
                      isServiceAcceptedVisible = true;
                    });
                  },
                )),
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
            isServiceDetailVisible ? serviceDetails() : const SizedBox(),
            isServiceAcceptedVisible ? serviceAccepted() : const SizedBox(),
            isServiceCanceledVisible ? serviceCanceled() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
