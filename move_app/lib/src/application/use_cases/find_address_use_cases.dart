import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IGetAddressByGeopointUseCase)
class GetMyAddressByGeopointUseCase implements IGetAddressByGeopointUseCase {
  final IGetAddressByGeopointService _addressService;

  GetMyAddressByGeopointUseCase(this._addressService);

  @override
  Future<TravelPoint> getAddress(GeoPointRequest request) {
    return _addressService.getAddress(
      latitude: request.latitude,
      longitude: request.longitude,
    );
  }
}

@Injectable(as: IGetAddressesByQueryUseCase)
class GetAddressesByQueryUseCase implements IGetAddressesByQueryUseCase {
  final IGetAddressByQueryService _addressService;

  GetAddressesByQueryUseCase(this._addressService);

  @override
  Future<List<TravelPoint>> getAddresses(QueryAddressRequest request) {
    return _addressService.getAddresses(request.query,
        latitudeRef: request.latitudeRef, longitudeRef: request.longitudeRef);
  }
}

@Injectable(as: IGetKnownAddressesUseCase)
class GetKnownAddressesUseCase implements IGetKnownAddressesUseCase {
  final IGetKnownAddressesService _addressService;

  GetKnownAddressesUseCase(this._addressService);

  @override
  Future<List<TravelPoint>> getKnownAddresses({
    String? tag,
  }) {
    return _addressService.getKnownAddresses(tag: tag);
  }
}
