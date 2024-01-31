import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IGetKnownAddressesService)
class SqfliteGetKnownAddressesService implements IGetKnownAddressesService {
  final ITravelPointRepository _travelPointRepository;

  SqfliteGetKnownAddressesService(this._travelPointRepository);
  @override
  Future<List<TravelPoint>> getKnownAddresses({String? tag}) {
    return _travelPointRepository.getAll(tag);
  }
}

@Injectable(as: ISaveAddressService)
class SqfliteSaveAddressService implements ISaveAddressService {
  final ITravelPointRepository _travelPointRepository;

  SqfliteSaveAddressService(this._travelPointRepository);
  @override
  Future<void> saveAddress(
      {required String tag, required TravelPoint address}) {
    return _travelPointRepository.save(tag, address);
  }
}
