import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

class RequestService extends GetView<RequestServiceCtrl> {
  const RequestService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => AddressField(
                  color: Colors.blue,
                  name: controller.beginTravelPoint?.name ?? 'Recogida',
                  address: controller.beginTravelPoint?.address ??
                      'Dirección de recogida',
                  onTap: () {
                    controller.onEditingBeginAddress();
                    controller.openSearchAddress(context);
                  },
                )),
            const SizedBox(height: 10.0),
            Obx(() => AddressField(
                  color: Colors.redAccent,
                  name: controller.endTravelPoint?.name ?? 'Llegada',
                  address: controller.endTravelPoint?.address ??
                      'Dirección de llegada',
                  onTap: () {
                    controller.onEditingEndAddress();
                    controller.openSearchAddress(context);
                  },
                )),
            const SizedBox(height: 10.0),
            FeeButton(onTap: () {
              controller.openSetTee(context);
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ButtonClassic(
                text: "Solicitar servicio",
                onPressed: () {
                  controller.requestService(context);
                },
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
            PolylineLayer(
              polylines: [
                if (controller.beginTravelPoint != null &&
                    controller.endTravelPoint != null)
                  Polyline(
                    points: [
                      LatLng(
                        controller.beginTravelPoint!.latitude,
                        controller.beginTravelPoint!.longitude,
                      ),
                      LatLng(
                        controller.endTravelPoint!.latitude,
                        controller.endTravelPoint!.longitude,
                      ),
                    ],
                    strokeWidth: 4.0,
                    color: Colors.redAccent,
                  ),
              ],
            ),
            _buildMarkerLayer(),
          ],
        ));
  }

  MarkerLayer _buildMarkerLayer() {
    return MarkerLayer(
      markers: [
        if (controller.beginTravelPoint != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              controller.beginTravelPoint!.latitude,
              controller.beginTravelPoint!.longitude,
            ),
            rotate: true,
            child: const Icon(
              Icons.person_pin_circle,
              size: 45.0,
              color: Colors.redAccent,
            ),
          ),
        if (controller.endTravelPoint != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              controller.endTravelPoint!.latitude,
              controller.endTravelPoint!.longitude,
            ),
            rotate: true,
            child: const Icon(
              Icons.location_on,
              size: 45.0,
              color: Colors.blue,
            ),
          ),
      ],
    );
  }
}
