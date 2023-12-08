import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:sqflite/sqflite.dart';

// ------------------------------------ Firebase ------------------------------------

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
      androidProvider: AndroidProvider.playIntegrity,
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

// ------------------------------------ Dio ------------------------------------

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [401, 403],
        ),
      ),
    ]);
}

// ------------------------------------ SQFLite ------------------------------------

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/travel_point.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS travel_point ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "latitude REAL,"
          "longitude REAL,"
          "address TEXT,"
          "name TEXT,"
          "tag TEXT"
          ")",
        );
      },
    );
  }
}

// ----------------------------- Audio Player --------------------------------
@module
abstract class AudioPlayerModule {
  @lazySingleton
  AudioPlayer get audioPlayer => AudioPlayer();
}
