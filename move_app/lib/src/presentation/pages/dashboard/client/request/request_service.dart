import 'package:flutter_map/flutter_map.dart';
import 'package:move_app/lib.dart';

class RequestService extends GetView<RequestServiceCtrl> {
  const RequestService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height / 3,
            child: _buildMap(),
          ),
          Positioned(
            right: 16.0,
            top: MediaQuery.of(context).size.height / 2.2 + 16.0,
            child: _buildLocationButton(),
          ),
          Positioned(
            left: 16.0,
            top: MediaQuery.of(context).padding.top + 16.0,
            child: _buildBackButton(),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 2.2 + 86.0,
            child: _buildRequestForm(context),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestForm(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.0,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Solicitar servicio',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            AddressField(
              color: Colors.blue,
              address: 'Calle 1 # 2 - 3',
              onTap: () {
                controller.openSearchAddress(context);
              },
            ),
            const SizedBox(height: 10.0),
            AddressField(
              color: Colors.redAccent,
              address: 'Calle 1 # 2 - 3',
              onTap: () {
                controller.openSearchAddress(context);
              },
            ),
            const SizedBox(height: 10.0),
            FeeButton(onTap: () {
              controller.openSetTee(context);
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ButtonClassic(
                text: "Solicitar servicio",
                onPressed: () {},
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildBackButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.back();
      },
      child: const Icon(Icons.arrow_back),
    );
  }

  FloatingActionButton _buildLocationButton() {
    final locationCtrl = Get.find<LocationCtrl>();
    return FloatingActionButton(
      heroTag: "navigation_button",
      onPressed: () {
        locationCtrl.moveCameraToCurrentLocation();
      },
      child: const Icon(Icons.navigation_rounded),
    );
  }

  Widget _buildMap() {
    final locationCtrl = Get.find<LocationCtrl>();
    return Obx(() => FlutterMap(
          mapController: locationCtrl.mapCtrl,
          options: MapOptions(
            initialCenter: locationCtrl.currentLocation,
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: mapsTileUrl,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: locationCtrl.currentLocation,
                  rotate: true,
                  child: const Icon(
                    Icons.person_pin_circle,
                    size: 45.0,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
