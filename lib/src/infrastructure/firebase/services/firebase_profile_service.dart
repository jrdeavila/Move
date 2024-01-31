import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IProfileService)
class FirebaseProfileService implements IProfileService {
  final FirebaseFirestore _firestore;

  FirebaseProfileService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Future<void> updateProfileLocationData(AppUser user,
      {required double latitude, required double longitude}) {
    return _firestore.collection('users').doc(user.uuid).update({
      'location': GeoPoint(latitude, longitude),
    });
  }
}
