import 'dart:ui';
import 'package:move_app/lib.dart';

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
        child: ServiceCanceled(onVisibilityChangedServiceCanceled: (isVisible) {
          setState(() {
            isServiceCanceledVisible = isVisible;
          });
        }, onVisibilityChangedServiceAccepted: (isVisible) {
          setState(() {
            isServiceAcceptedVisible = isVisible;
          });
        }));
  }

  Widget serviceAccepted() {
    return Positioned(
        top: Dimensions.screenHeight * 0.53,
        child: ServiceAccepted(
            paymentController: paymentController,
            controllerInitialLocation: controllerInitialLocation,
            controllerFinalLocation: controllerFinalLocation,
            onVisibilityChanged: (isVisible) {
              setState(() {
                isServiceCanceledVisible = isVisible;
              });
            }));
  }

  Widget serviceDetails() {
    return Positioned(
        top: Dimensions.screenHeight * 0.6,
        child: ServiceDetails(
            paymentController: paymentController,
            controllerInitialLocation: controllerInitialLocation,
            controllerFinalLocation: controllerFinalLocation,
            onVisibilityChanged: (isVisible) {
              setState(() {
                isServiceAcceptedVisible = isVisible;
              });
            }));
  }

  Widget rateForm() {
    return Positioned(
        top: Dimensions.screenHeight * 0.6,
        child: RateForm(
          paymentController: paymentController,
          onVisibilityChanged: (isVisible) {
            setState(() {
              isRateFormVisible = isVisible;
            });
          },
          onPaymentChanged: (newPayment) {
            setState(() {
              payment = newPayment;
            });
          },
        ));
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
                  colorTextUser: Colors.black,
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
