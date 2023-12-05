import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

class RequestServicePage extends GetView<RequestServiceCtrl> {
  const RequestServicePage({super.key});

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
            top: MediaQuery.of(context).size.height / 2.3 + 16.0,
            child: _buildLocationButton(),
          ),
          Positioned(
            left: 16.0,
            top: MediaQuery.of(context).padding.top + 16.0,
            child: _buildBackButton(),
          ),
          Positioned.fill(
            child: _buildLoading(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.3 + 86.0,
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildCurrentAction(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentAction(BuildContext context) {
    final ListenCurrentServiceCtrl listenCurrentServiceCtrl =
        Get.find<ListenCurrentServiceCtrl>();
    return Obx(() {
      if (listenCurrentServiceCtrl.currentRequestService?.status ==
          RequestServiceStatus.waiting) {
        return const ServiceDetailsView();
      }
      if (listenCurrentServiceCtrl.currentRequestService?.status ==
          RequestServiceStatus.started) {
        return const ServiceAccepted();
      }
      return const FormRequestService();
    });
  }

  Obx _buildLoading() {
    return Obx(() => controller.loading
        ? Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox.shrink());
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
            _buildPolylineLayer(),
            _buildMarkerLayer(),
            _buildDriverLocationLayer(),
          ],
        ));
  }

  MarkerLayer _buildDriverLocationLayer() {
    final listenCurrentServiceCtrl = Get.find<ListenCurrentServiceCtrl>();
    return MarkerLayer(
      markers: [
        if (listenCurrentServiceCtrl.driverLocation != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              listenCurrentServiceCtrl.driverLocation!.latitude,
              listenCurrentServiceCtrl.driverLocation!.longitude,
            ),
            rotate: true,
            child: Icon(Icons.directions_car,
                size: 45.0, color: Get.theme.colorScheme.primary),
          ),
      ],
    );
  }

  PolylineLayer _buildPolylineLayer() {
    return PolylineLayer(
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
    );
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
              Icons.location_on,
              size: 45.0,
              color: Colors.blueAccent,
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
              color: Colors.redAccent,
            ),
          ),
      ],
    );
  }
}
