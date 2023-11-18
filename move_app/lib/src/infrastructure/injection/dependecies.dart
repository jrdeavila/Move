import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@module
abstract class FirebaseAppModule {
  @preResolve
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
}

@module
abstract class FirebaseAuthModule {
  @preResolve
  @lazySingleton
  Future<FirebaseAuth> get firebaseAuth async {
    return FirebaseAuth.instanceFor(app: getIt<FirebaseApp>());
  }
}

@module
abstract class FirestoreModule {
  @preResolve
  @lazySingleton
  Future<FirebaseFirestore> get firestore async =>
      FirebaseFirestore.instanceFor(app: getIt<FirebaseApp>());
}

@module
abstract class AppCheckModule {
  @preResolve
  @lazySingleton
  Future<FirebaseAppCheck> get appCheck async {
    final appCheck = FirebaseAppCheck.instanceFor(app: getIt<FirebaseApp>());
    await appCheck.activate(
      androidProvider: AndroidProvider.debug,
    );
    return appCheck;
  }
}

@module
abstract class FirebaseStorageModule {
  @preResolve
  @lazySingleton
  Future<FirebaseStorage> get firebaseStorage async =>
      FirebaseStorage.instanceFor(
        app: getIt<FirebaseApp>(),
        bucket: "gs://mevo-ceb14.appspot.com",
      );
}
