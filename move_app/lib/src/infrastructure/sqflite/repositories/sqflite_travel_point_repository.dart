import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:sqflite/sqflite.dart';

@Injectable(as: ITravelPointRepository)
class SqfliteTravelPointRepository implements ITravelPointRepository {
  final Database _database;

  SqfliteTravelPointRepository(this._database);
  @override
  Future<void> delete(String tag, TravelPoint address) {
    return _database.delete(
      'travel_point',
      where: 'tag = ? AND latitude = ? AND longitude = ?',
      whereArgs: [tag, address.latitude, address.longitude],
    );
  }

  @override
  Future<List<TravelPoint>> getAll(String? tag) {
    return _database.query(
      'travel_point',
      where: 'tag = ?',
      whereArgs: [tag],
    ).then((value) => value.map((e) => travelPointFromDatabase(e)).toList());
  }

  @override
  Future<void> save(String tag, TravelPoint address) async {
    final checkIfExists = await _database.query(
      'travel_point',
      where: 'tag = ? AND latitude = ? AND longitude = ?',
      whereArgs: [tag, address.latitude, address.longitude],
    );
    if (checkIfExists.isNotEmpty) {
      return;
    }
    await _database.insert(
      'travel_point',
      {
        'tag': tag,
        'latitude': address.latitude,
        'longitude': address.longitude,
        'address': address.address,
        'name': address.name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

TravelPoint travelPointFromDatabase(Map<String, dynamic> map) => TravelPoint(
      latitude: map['latitude'],
      longitude: map['longitude'],
      address: map['address'],
      name: map['name'],
      type: TravelPointType.known,
    );
