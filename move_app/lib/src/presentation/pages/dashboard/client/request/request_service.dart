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
            top: MediaQuery.of(context).size.height / 2 + 16.0,
            child: _buildBackButton(),
          ),
          Positioned(
            left: 16.0,
            top: MediaQuery.of(context).padding.top + 16.0,
            child: _buildLocationButton(),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 2 + 86.0,
            child: _buildRequestForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestForm() {
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
              onTap: () {},
            ),
            const SizedBox(height: 10.0),
            AddressField(
              color: Colors.redAccent,
              address: 'Calle 1 # 2 - 3',
              onTap: () {},
            ),
            const SizedBox(height: 10.0),
            const FeeButton(),
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
    final locationCtrl = Get.find<LocationCtrl>();
    return FloatingActionButton(
      onPressed: () {
        locationCtrl.moveCameraToCurrentLocation();
      },
      child: const Icon(Icons.arrow_back),
    );
  }

  FloatingActionButton _buildLocationButton() {
    final locationCtrl = Get.find<LocationCtrl>();
    return FloatingActionButton(
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

class FeeButton extends StatelessWidget {
  const FeeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Icon(
            Icons.payments_rounded,
            color: Colors.redAccent,
            size: 30.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            "Ofrezca su tarifa",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.phone_iphone_sharp,
            color: Colors.blue,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    required this.color,
    required this.address,
    required this.onTap,
  });

  final Color color;
  final String address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.location_on_rounded,
            color: color,
            size: 30.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Text(
                address,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
