import 'package:mevo/lib.dart';

abstract class ITravelPointRepository {
  Future<List<TravelPoint>> getAll(String? tag);
  Future<void> save(String tag, TravelPoint address);
  Future<void> delete(String tag, TravelPoint address);
}
