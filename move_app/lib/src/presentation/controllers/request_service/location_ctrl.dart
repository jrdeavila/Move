import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

class LocationCtrl extends GetxController {
  // -------------------- Final Variables --------------------

  final mapCtrl = MapController();
  final GetStorage _getStorage = GetStorage();

  // --------------------- Observables ---------------------

  final Rx<LatLng?> _currentLocation = Rx<LatLng?>(null);

  // --------------------- Getters ---------------------
  LatLng get currentLocation =>
      _currentLocation.value ?? const LatLng(10.4634, -73.2532);

  // --------------------- Lyfecycles ---------------------

  @override
  void onReady() {
    super.onReady();
    _requestPermissions();
    ever(_currentLocation, _saveLastLocation);
    ever(_currentLocation, _moveCamera);
    ever(_currentLocation, _searchCurrentTravelPoint,
        condition: (LatLng? location) => location != null);
    _getCurrentLocation();
  }

  // --------------------- Private Methods ---------------------

  void _requestPermissions() async {
    final request = await Geolocator.requestPermission();
    if (request == LocationPermission.denied) {
      await Geolocator.openAppSettings();
    }
    if (request == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }
  }

  void _getCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition();
    _currentLocation.value = LatLng(location.latitude, location.longitude);
  }

  void _saveLastLocation(LatLng? location) {
    _getStorage.write("last_location", location);
  }

  void _moveCamera(LatLng? location) {
    if (location == null) return;
    mapCtrl.move(location, 15);
  }

  void _searchCurrentTravelPoint(LatLng? location) {
    final useCase = getIt<IGetAddressByGeopointUseCase>();
    useCase
        .getAddress(GeoPointRequest(
      latitude: location!.latitude,
      longitude: location.longitude,
    ))
        .then((value) {
      Get.find<RequestServiceCtrl>().setBeginTravelPoint(value);
    });
  }

  // --------------------- Public Methods ---------------------

  void moveCameraToCurrentLocation() async {
    _getCurrentLocation();
    mapCtrl.move(currentLocation, 15);
    mapCtrl.rotate(0.0);
  }
}
