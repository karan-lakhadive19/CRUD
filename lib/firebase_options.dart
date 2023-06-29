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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCo_I5jtpnPLVG90WyZOmvKihU_-FC41Es',
    appId: '1:948135875611:web:077f2e9834ebed845cd4be',
    messagingSenderId: '948135875611',
    projectId: 'crud-f2452',
    authDomain: 'crud-f2452.firebaseapp.com',
    storageBucket: 'crud-f2452.appspot.com',
    measurementId: 'G-1BM4P2MR2X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnRP8SyzA-xf7AYLZKE5-Z4PHUUaPDyFU',
    appId: '1:948135875611:android:c2c0acd1cbc7d34e5cd4be',
    messagingSenderId: '948135875611',
    projectId: 'crud-f2452',
    storageBucket: 'crud-f2452.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7Oann-bcRLY6Tcc9wmgWCmakMmDhjTIE',
    appId: '1:948135875611:ios:0509a9046ea1f1485cd4be',
    messagingSenderId: '948135875611',
    projectId: 'crud-f2452',
    storageBucket: 'crud-f2452.appspot.com',
    iosClientId: '948135875611-160cca95q7h6redi36kp5pairb11e06a.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7Oann-bcRLY6Tcc9wmgWCmakMmDhjTIE',
    appId: '1:948135875611:ios:0509a9046ea1f1485cd4be',
    messagingSenderId: '948135875611',
    projectId: 'crud-f2452',
    storageBucket: 'crud-f2452.appspot.com',
    iosClientId: '948135875611-160cca95q7h6redi36kp5pairb11e06a.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );
}