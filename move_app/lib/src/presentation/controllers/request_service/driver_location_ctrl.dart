import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:move_app/lib.dart';

class DriverLocationCtrl extends GetxController {
  // -------------------- Final Variables --------------------
  final AppUser user;
  final mapCtrl = MapController();
  final GetStorage _getStorage = GetStorage();

  // --------------------- Constructor ---------------------

  DriverLocationCtrl({
    required this.user,
  });

  // ------------------- No Observable -------------------
  bool _alreadyInitialized = false;

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
    ever(_currentLocation, _saveInProfileData);
    ever(_currentLocation, _saveLastLocation);
    ever(_currentLocation, _moveCamera);

    _listenLocation();
  }

  @override
  void onClose() {
    _currentLocation.close();
    mapCtrl.dispose();

    super.onClose();
  }

  // --------------------- Private Methods ---------------------

  void _listenLocation() {
    _currentLocation.bindStream(Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).map((event) => LatLng(event.latitude, event.longitude)));
  }

  void _saveInProfileData(LatLng? location) {
    final useCase = getIt<IUpdateProfileLocationDataUseCase>();
    useCase.updateProfileData(
      UpdateProfileLocationDataRequest(
        user: user,
        latitude: location!.latitude,
        longitude: location.longitude,
      ),
    );
  }

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
    if (!_alreadyInitialized) return;
    if (location == null) return;
    mapCtrl.move(location, 15);
  }

  //-------------------------- Public Methods --------------------------

  void moveCameraToCurrentLocation() async {
    _getCurrentLocation();
    mapCtrl.move(currentLocation, 15);
    mapCtrl.rotate(0.0);
  }

  void focusOnTravelPoint(TravelPoint travelPoint) {
    mapCtrl.moveAndRotate(
      LatLng(
        travelPoint.latitude,
        travelPoint.longitude,
      ),
      14.0,
      0.0,
    );
  }

  void mapInitialized() {
    _alreadyInitialized = true;
  }
}
