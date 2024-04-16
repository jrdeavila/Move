import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IQualifyRequestServiceService)
class FirebaseQualifyRequestServiceService
    implements IQualifyRequestServiceService {
  final FirebaseFirestore _firestore;

  FirebaseQualifyRequestServiceService(this._firestore);

  @override
  Future<void> qualifyService(RequestService requestService, double rating) {
    return _firestore.collection('services').doc(requestService.uuid).update({
      "status": RequestServiceStatus.qualified.toString(),
      "rating": rating,
    });
  }
}
