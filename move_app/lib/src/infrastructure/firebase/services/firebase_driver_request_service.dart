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
  Future<DNISection> getDNISection(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists && doc.data()!.containsKey("dni_section")) {
        return dniSectionFromJson(doc.data()!["dni_section"]);
      } else {
        return DNISection.empty();
      }
    });
  }

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
  Future<DriverLicenseSection> getDriverLicenseSection(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists && doc.data()!.containsKey("driver_license_section")) {
        return driverLicenseSectionFromJson(
            doc.data()!["driver_license_section"]);
      } else {
        return DriverLicenseSection.empty();
      }
    });
  }

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
  Future<AboutCarSection> getAboutCarSection(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists && doc.data()!.containsKey("about_car_section")) {
        return aboutCarSectionFromJson(doc.data()!["about_car_section"]);
      } else {
        return AboutCarSection.empty();
      }
    });
  }

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
  Future<NoCriminalRecordSection> getNoCriminalRecordSection(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      if (doc.exists && doc.data()!.containsKey("no_criminal_record_section")) {
        return noCriminalRecordSectionFromJson(
            doc.data()!["no_criminal_record_section"]);
      } else {
        return NoCriminalRecordSection.empty();
      }
    });
  }

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
  Future<AboutMeSection> getAboutMeSection(AppUser user) {
    return _firebaseFirestore
        .collection("driver_request")
        .doc(user.uuid)
        .get()
        .then((doc) {
      return aboutMeSectionFromJson(doc.data());
    });
  }

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
      "status": DriverRequestStatus.finalized,
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
