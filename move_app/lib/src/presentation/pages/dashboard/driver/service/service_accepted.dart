import 'package:move_app/lib.dart';

class ServiceAcceptedDriver extends StatefulWidget {
  const ServiceAcceptedDriver({Key? key}) : super(key: key);

  @override
  State<ServiceAcceptedDriver> createState() => _ServiceAcceptedDriverState();
}

class _ServiceAcceptedDriverState extends State<ServiceAcceptedDriver> {
  final String controllerInitialLocation = 'Cll 7a.24-31 la esperanza';
  final String controllerFinalLocation = 'los cortijos';
  final String paymentController = '8000';
  static const LatLng _pGooglePlex =
      LatLng(10.480301856994629, -73.26976776123047);
  bool isServiceDetailVisible = true;
  bool serviceCompleted = false;
  bool isServiceCanceledVisible = false;

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
        child: ServiceCanceledDriver(
          onVisibilityChangedServiceCanceled: (isCanceled) {
            setState(() {
              isServiceCanceledVisible = isCanceled;
            });
          },
        ));
  }

  Widget serviceDetails() {
    return Positioned(
        top: Dimensions.screenHeight * 0.5,
        child: ServiceDetailsDriver(
          paymentController: paymentController,
          controllerInitialLocation: controllerInitialLocation,
          controllerFinalLocation: controllerFinalLocation,
          onVisibilityChanged: (isVisible) {
            setState(() {
              serviceCompleted = isVisible;
            });
          },
          onVisibilityCancelService: (isVisibelForm) {
            setState(() {
              isServiceCanceledVisible = isVisibelForm;
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
            serviceDetails(),
            isServiceCanceledVisible ? serviceCanceled() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
