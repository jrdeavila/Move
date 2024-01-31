import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mevo/lib.dart';

class LocationCtrl extends GetxController {
  // -------------------- Final Variables --------------------

  final GetStorage _getStorage = GetStorage();
  final AppUser user;

  // -------------------- Constructor --------------------

  LocationCtrl({
    required this.user,
  });

  // --------------------- Observables ---------------------

  final Rx<LatLng?> _currentLocation = Rx<LatLng?>(null);
  final Rx<MapController?> _mapCtrl = Rx<MapController?>(null);

  // --------------------- Getters ---------------------
  LatLng get currentLocation =>
      _currentLocation.value ?? const LatLng(10.4634, -73.2532);

  MapController? get mapCtrl => _mapCtrl.value;

  // --------------------- Setters ---------------------

  void setMapCtrl(MapController mapController) {
    _mapCtrl.value?.dispose();
    _mapCtrl.value = null;
    _mapCtrl.value = mapController;
  }

  // --------------------- Lyfecycles ---------------------

  @override
  void onReady() {
    super.onReady();
    _requestPermissions();
    ever(_currentLocation, _saveLastLocation);
    ever(_currentLocation, _saveInProfileData);
    ever(_currentLocation, _moveCamera);
    ever(_currentLocation, _searchCurrentTravelPoint,
        condition: (LatLng? location) => location != null);
    _listenLocation();
  }

  @override
  void onClose() {
    _currentLocation.close();
    _mapCtrl.value?.dispose();

    super.onClose();
  }

  // --------------------- Private Methods ---------------------

  void _requestPermissions() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return;
    }
    final request = await Geolocator.requestPermission();
    if (request == LocationPermission.denied) {
      await Geolocator.openAppSettings();
    }
    if (request == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }
  }

  void _listenLocation() {
    _currentLocation.bindStream(Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).map((event) => LatLng(event.latitude, event.longitude)));
  }

  void _getCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition();
    _currentLocation.value = LatLng(location.latitude, location.longitude);
  }

  void _saveLastLocation(LatLng? location) {
    _getStorage.write("last_location", location);
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

  void _moveCamera(LatLng? location) {
    if (location == null) return;
    if (_mapCtrl.value == null) return;
    _mapCtrl.value!.move(location, 15);
    _mapCtrl.value!.rotate(0.0);
  }

  void _searchCurrentTravelPoint(LatLng? location) {
    final useCase = getIt<IGetAddressByGeopointUseCase>();
    useCase
        .getAddress(GeoPointRequest(
      latitude: location!.latitude,
      longitude: location.longitude,
    ))
        .then((value) {
      if (Get.find<SessionCtrl>().currentSessionRole == AppUserRole.client) {
        Get.find<RequestServiceCtrl>().setBeginTravelPoint(value);
      }
    });
  }

  // --------------------- Public Methods ---------------------

  void moveCameraToCurrentLocation() async {
    _getCurrentLocation();
    _moveCamera(currentLocation);
  }

  void moveCameraToLocation(LatLng location) {
    _moveCamera(location);
  }

  void focusOnTravelPoint(TravelPoint travelPoint) {
    _mapCtrl.value?.moveAndRotate(
      LatLng(
        travelPoint.latitude,
        travelPoint.longitude,
      ),
      14.0,
      0.0,
    );
  }
}
