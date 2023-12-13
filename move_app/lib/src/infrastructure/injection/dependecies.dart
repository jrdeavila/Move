import 'dart:io';

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

// -------------------------- Flutter Local Notification --------------------------

@module
abstract class FlutterLocalNotificationModule {
  @preResolve
  @lazySingleton
  Future<FlutterLocalNotificationsPlugin>
      get flutterLocalNotificationsPlugin async {
    final plugin = FlutterLocalNotificationsPlugin();
    // Initialization settings for Android and iOS.
    // Note: permissions aren't requested here just to demonstrate that can be
    // done later using the `requestPermissions()` method.
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await plugin.initialize(
      initializationSettings,
    );
    // Request Android permissions for displaying notifications.
    if (Platform.isAndroid) {
      await plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    // Request iOS permissions for displaying notifications.
    if (Platform.isIOS) {
      await plugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    return plugin;
  }
}
