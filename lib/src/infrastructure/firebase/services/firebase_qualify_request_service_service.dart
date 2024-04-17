import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IQualifyRequestServiceService)
class FirebaseQualifyRequestServiceService
    implements IQualifyRequestServiceService {
  final FirebaseFirestore _firestore;

  FirebaseQualifyRequestServiceService(this._firestore);

  @override
  Future<void> qualifyService(RequestService requestService, double rating) {
    return _firestore.runTransaction((transaction) async {
      final serviceRef =
          _firestore.collection("services").doc(requestService.uuid);

      final driverRef =
          _firestore.collection("users").doc(requestService.driver!.uuid);

      driverRef.collection("qualifications").add({
        "rating": rating,
        "user_uuid": requestService.clientCreator.uuid,
      });

      var docs = (await driverRef.collection("qualifications").get()).docs;
      final totalRating = docs
              .map((e) => e.data()['rating'] as double)
              .fold(0.0, (previousValue, element) => element + previousValue) /
          docs.length;

      await driverRef.update({
        "rating": totalRating,
      });

      transaction.update(serviceRef, {
        "status": RequestServiceStatus.qualified.toString(),
        "rating": rating,
      });
    });

    // return _firestore.collection('services').doc(requestService.uuid).update({
    //   "status": RequestServiceStatus.qualified.toString(),
    //   "rating": rating,
    // });
  }
}
