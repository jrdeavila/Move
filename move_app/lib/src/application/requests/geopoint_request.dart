import 'package:move_app/lib.dart';

class GeoPointRequest {
  GeoPointRequest({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}

class QueryAddressRequest {
  QueryAddressRequest({
    required this.query,
    this.latitudeRef,
    this.longitudeRef,
  });

  final String query;
  final double? latitudeRef;
  final double? longitudeRef;
}

class SaveAddressRequest {
  final String tag;
  final TravelPoint address;

  SaveAddressRequest({
    required this.tag,
    required this.address,
  });
}
