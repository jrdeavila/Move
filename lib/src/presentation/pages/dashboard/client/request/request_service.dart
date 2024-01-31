import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mevo/lib.dart';

class RequestServicePage extends GetView<RequestServiceCtrl> {
  const RequestServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var listeCtrl = Get.find<ListenCurrentServiceCtrl>();
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
              bottom: 466.0,
              child: _buildLocationButton(),
            ),
            Positioned(
              left: 16.0,
              top: MediaQuery.of(context).padding.top + 16.0,
              child: _buildBackButton(),
            ),
            _buildCounterOfferts(context),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildCurrentAction(context),
            ),
            Positioned.fill(
              child: _buildLoading(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterOfferts(context) {
    final ListenCurrentServiceCtrl listenCurrentServiceCtrl =
        Get.find<ListenCurrentServiceCtrl>();
    return Obx(() {
      if (listenCurrentServiceCtrl.currentRequestService?.status ==
          RequestServiceStatus.started) {
        return Positioned(
          child: Container(),
        );
      }
      if (listenCurrentServiceCtrl.listCounterOffers.isEmpty) {
        return Positioned(child: Container());
      }
      return Positioned.fill(
        bottom: MediaQuery.of(context).size.height / 2.3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.0,
                offset: const Offset(0.0, -4.0),
              ),
            ],
          ),
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final offer = listenCurrentServiceCtrl.listCounterOffers[index];
              return OfferCardItem(
                offer: offer,
              );
            },
            itemCount: listenCurrentServiceCtrl.listCounterOffers.length,
          ),
        ),
      );
    });
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
        final listenCurrentServiceCtrl = Get.find<ListenCurrentServiceCtrl>();
        if (listenCurrentServiceCtrl.currentRequestService == null) {
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
            ),
            _buildMyLocation(),
            _buildMarkerLayer(),
            _buildDriverLocationLayer(),
            _buildCurrentRequestServiceTravel(),
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

  MarkerLayer _buildCurrentRequestServiceTravel() {
    final controller = Get.find<ListenCurrentServiceCtrl>();
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
      ],
    );
  }

  MarkerLayer _buildMyLocation() {
    return MarkerLayer(
      markers: [
        Marker(
          point: Get.find<LocationCtrl>().currentLocation,
          child: const Icon(
            Icons.location_on,
            size: 45.0,
            color: Colors.orangeAccent,
          ),
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
