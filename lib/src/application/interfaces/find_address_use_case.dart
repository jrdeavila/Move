import 'package:mevo/lib.dart';

abstract class IGetAddressByGeopointUseCase {
  Future<TravelPoint> getAddress(GeoPointRequest request);
}

abstract class IGetAddressesByQueryUseCase {
  Future<List<TravelPoint>> getAddresses(QueryAddressRequest request);
}

abstract class IGetKnownAddressesUseCase {
  Future<List<TravelPoint>> getKnownAddresses({
    String tag,
  });
}

abstract class ISaveAddressUseCase {
  Future<void> saveAddress(SaveAddressRequest request);
}
