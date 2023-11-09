import 'request.dart';

class RequestService extends StatefulWidget {
  const RequestService({super.key});

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  static const LatLng _pGooglePlex =
      LatLng(10.480301856994629, -73.26976776123047);

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
              top: Dimensions.screenHeight * 0.65,
              child: Container(
                width: Dimensions.screenWidth * 1,
                height: Dimensions.screenHeight * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
