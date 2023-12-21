// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8tuDvLiRFNDh-pNHmCzNKHjAVbSjI1tw',
    appId: '1:64558452563:android:75d65c35457beb86c55ba6',
    messagingSenderId: '64558452563',
    projectId: 'mevo-ceb14',
    storageBucket: 'mevo-ceb14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPDVhp1w7-pKBRPc6oo-aUPdhQiT4BD9A',
    appId: '1:64558452563:ios:e220c21c1861d94bc55ba6',
    messagingSenderId: '64558452563',
    projectId: 'mevo-ceb14',
    storageBucket: 'mevo-ceb14.appspot.com',
    androidClientId: '64558452563-8bapa3dkmr416vpst7jpmupi438hpnp7.apps.googleusercontent.com',
    iosClientId: '64558452563-r9q7ar2ba31jgh3st6smfs9gbb8ucqqo.apps.googleusercontent.com',
    iosBundleId: 'com.example.moveApp',
  );
}
