import 'package:cloud_firestore/cloud_firestore.dart';
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
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instanceFor(
        app: getIt<FirebaseApp>(),
      );
}

@module
abstract class FirestoreModule {
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instanceFor(
        app: getIt<FirebaseApp>(),
      );
}
