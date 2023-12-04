import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IGetKnownAddressesService)
class CacheGetKnownAddressesService implements IGetKnownAddressesService {
  @override
  Future<List<TravelPoint>> getKnownAddresses({String? tag}) {
    // TODO: implement getKnownAddresses
    throw UnimplementedError();
  }
}
