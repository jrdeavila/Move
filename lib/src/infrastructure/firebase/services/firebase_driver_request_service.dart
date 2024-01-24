import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

// -------------------------------- DNI SECTION SERVICE --------------------------------
@Injectable(as: IDNISectionService)
class FirebaseDNISectionService implements IDNISectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseDNISectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<DNISection> setDNISection(AppUser user, DNISection dniSection) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(dniSectionToJson(dniSection), SetOptions(merge: true));
    return dniSection;
  }
}

// --------------------------- DRIVER LICENSE SECTION SERVICE ---------------------------

@Injectable(as: IDriverLicenseSectionService)
class FirebaseDriverLicenseSectionService
    implements IDriverLicenseSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseDriverLicenseSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<DriverLicenseSection> setDriverLicenseSection(
      AppUser user, DriverLicenseSection driverLicenseSection) async {
    await _firebaseFirestore.collection("driver_request").doc(user.uuid).set(
        driverLicenseSectionToJson(driverLicenseSection),
        SetOptions(merge: true));
    return driverLicenseSection;
  }
}

// --------------------------- ABOUT CAR SECTION SERVICE ---------------------------

@Injectable(as: IAboutCarSectionService)
class FirebaseAboutCarSectionService implements IAboutCarSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseAboutCarSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<AboutCarSection> setAboutCarSection(
      AppUser user, AboutCarSection aboutCarSection) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(aboutCarSectionToJson(aboutCarSection), SetOptions(merge: true));
    return aboutCarSection;
  }
}

// --------------------------- NO CRIMINAL RECORD SECTION SERVICE ---------------------------

@Injectable(as: INoCriminalRecordSectionService)
class FirebaseNoCriminalRecordSectionService
    implements INoCriminalRecordSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseNoCriminalRecordSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<NoCriminalRecordSection> setNoCriminalRecordSection(
      AppUser user, NoCriminalRecordSection noCriminalRecordSection) async {
    await _firebaseFirestore.collection("driver_request").doc(user.uuid).set(
        noCriminalRecordSectionToJson(noCriminalRecordSection),
        SetOptions(merge: true));
    return noCriminalRecordSection;
  }
}

// --------------------------- ABOUT ME SECTION SERVICE ---------------------------

@Injectable(as: IAboutMeSectionService)
class FirebaseAboutMeSectionService implements IAboutMeSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseAboutMeSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<AboutMeSection> setAboutMeSection(
      AppUser user, AboutMeSection aboutMeSection) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(aboutMeSectionToJson(aboutMeSection), SetOptions(merge: true));
    return aboutMeSection;
  }
}

// --------------------------- SOAT SECTION SERVICE ---------------------------

@Injectable(as: ISoatSectionService)
class FirebaseSoatSectionService implements ISoatSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseSoatSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<SoatSection> setSoatSection(
      AppUser user, SoatSection soatSection) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(soatSectionToJson(soatSection), SetOptions(merge: true));
    return soatSection;
  }
}

// --------------------------- OWNER SHIP SECTION SERVICE ---------------------------

@Injectable(as: IOwnerShipCardSectionService)
class FirebaseOwnerShipSectionService implements IOwnerShipCardSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseOwnerShipSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<OwnerShipCardSection> setOwnerShipCardSection(
      AppUser user, OwnerShipCardSection ownerShipCardSection) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(ownerShipCardSectionToJson(ownerShipCardSection),
            SetOptions(merge: true))
        .then((value) => ownerShipCardSection);
  }
}

// --------------------------- TECHNICAL REVIEW SECTION SERVICE ---------------------------

@Injectable(as: ITechnicalReviewSectionService)
class FirebaseTechnicalReviewSectionService
    implements ITechnicalReviewSectionService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseTechnicalReviewSectionService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<TechnicalReviewSection> setTechnicalReviewSection(
      AppUser user, TechnicalReviewSection technicalReviewSection) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .set(technicalReviewSectionToJson(technicalReviewSection),
            SetOptions(merge: true))
        .then((value) => technicalReviewSection);
  }
}

// --------------------------- SEND DRIVER REQUEST SERVICE ---------------------------

@Injectable(as: ISendDriverRequestService)
class FirebaseSendDriverRequestService implements ISendDriverRequestService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseSendDriverRequestService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  @override
  Future<DriverRequest> setFinishDriverRequestSection(AppUser user) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .update({
      "status": driverRequestStatusToString(DriverRequestStatus.sended),
    });

    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists) {
        return driverRequestFromJson(doc.data()!);
      } else {
        return DriverRequest.empty();
      }
    });
  }
}

// --------------------------- FINISH DRIVER REQUEST SERVICE ---------------------------

@Injectable(as: IFinishDriverRequestService)
class FirebaseFinishDriverRequestService
    implements IFinishDriverRequestService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFinishDriverRequestService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  @override
  Future<DriverRequest> setFinishDriverRequestSection(AppUser user) async {
    await _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .update({
      "status": driverRequestStatusToString(DriverRequestStatus.finalized),
    });

    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists) {
        return driverRequestFromJson(doc.data()!);
      } else {
        return DriverRequest.empty();
      }
    });
  }
}

// --------------------------- GET DRIVER REQUEST SERVICE ---------------------------

@Injectable(as: IGetDriverRequestService)
class FirebaseGetDriverRequestService implements IGetDriverRequestService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseGetDriverRequestService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;
  @override
  Future<DriverRequest> getDriverRequest(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists) {
        return driverRequestFromJson(doc.data()!);
      } else {
        return DriverRequest.empty();
      }
    });
  }
}
