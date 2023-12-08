import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

class DriverCurrentServicePage extends GetView<ListenDriverCurrentServiceCtrl> {
  const DriverCurrentServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var listeCtrl = Get.find<ListenDriverCurrentServiceCtrl>();
        return listeCtrl.currentRequestService == null;
      },
      child: Scaffold(
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
      ),
    );
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
        final listenDriverCurrentServiceCtrl =
            Get.find<ListenDriverCurrentServiceCtrl>();
        if (listenDriverCurrentServiceCtrl.currentRequestService == null) {
          Get.back();
        }
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

  Widget _buildCurrentAction(BuildContext context) {
    final listenDriverCurrentServiceCtrl =
        Get.find<ListenDriverCurrentServiceCtrl>();
    return Obx(() {
      if (listenDriverCurrentServiceCtrl.currentRequestService != null) {
        return const ServiceDetailsDriver();
      }

      return const SizedBox.shrink();
    });
  }

  Widget _buildMap() {
    final locationCtrl = Get.find<LocationCtrl>();
    var mapCtrl = MapController();
    locationCtrl.setMapCtrl(mapCtrl);
    return Obx(() => FlutterMap(
          mapController: mapCtrl,
          options: MapOptions(
            initialCenter: locationCtrl.currentLocation,
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: mapsTileUrl,
              fallbackUrl: mapsTileFallbackUrl,
            ),
            _buildMarkerLayer(),
          ],
        ));
  }

  MarkerLayer _buildMarkerLayer() {
    final locationCtrl = Get.find<LocationCtrl>();
    return MarkerLayer(
      markers: [
        if (controller.currentRequestService != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              controller.currentRequestService!.origin.latitude,
              controller.currentRequestService!.origin.longitude,
            ),
            rotate: true,
            child: const Icon(
              Icons.location_on,
              size: 45.0,
              color: Colors.blueAccent,
            ),
          ),
        if (controller.currentRequestService != null)
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              controller.currentRequestService!.destination.latitude,
              controller.currentRequestService!.destination.longitude,
            ),
            rotate: true,
            child: const Icon(
              Icons.location_on,
              size: 45.0,
              color: Colors.redAccent,
            ),
          ),
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(
            locationCtrl.currentLocation.latitude,
            locationCtrl.currentLocation.longitude,
          ),
          rotate: true,
          child: Icon(
            Icons.directions_car,
            size: 45.0,
            color: Get.theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
