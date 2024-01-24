import 'package:move_app/lib.dart';

abstract class IGetKnownAddressesService {
  Future<List<TravelPoint>> getKnownAddresses({
    String? tag,
  });
}

abstract class ISaveAddressService {
  Future<void> saveAddress({
    required String tag,
    required TravelPoint address,
  });
}

abstract class IGetAddressByQueryService {
  Future<List<TravelPoint>> getAddresses(
    String query, {
    double? latitudeRef,
    double? longitudeRef,
  });
}

abstract class IGetAddressByGeopointService {
  Future<TravelPoint> getAddress({
    required double latitude,
    required double longitude,
  });
}
