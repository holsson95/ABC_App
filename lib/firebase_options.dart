// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDPPCKtoWNkUa5qhxP1FdlXEl1hinX4FaE',
    appId: '1:885400763379:web:ac19557a1bc4da9044f086',
    messagingSenderId: '885400763379',
    projectId: 'abc-chart-behavior-duo',
    authDomain: 'abc-chart-behavior-duo.firebaseapp.com',
    storageBucket: 'abc-chart-behavior-duo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClN2ktN58tzB1iPwJEUns6v-UX1wy66Ok',
    appId: '1:885400763379:android:3119e383ca3fff0d44f086',
    messagingSenderId: '885400763379',
    projectId: 'abc-chart-behavior-duo',
    storageBucket: 'abc-chart-behavior-duo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcBqSEabfePNjyic5qrO1koO-TiTcK1T0',
    appId: '1:885400763379:ios:85e37c0bc0600b5d44f086',
    messagingSenderId: '885400763379',
    projectId: 'abc-chart-behavior-duo',
    storageBucket: 'abc-chart-behavior-duo.appspot.com',
    androidClientId: '885400763379-ie8t24dn12eu330i8upk8n01r7onf966.apps.googleusercontent.com',
    iosClientId: '885400763379-gm1816qro066knh6fbhr24t7tub7cpn0.apps.googleusercontent.com',
    iosBundleId: 'com.behaviorduo.abcchart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcBqSEabfePNjyic5qrO1koO-TiTcK1T0',
    appId: '1:885400763379:ios:85e37c0bc0600b5d44f086',
    messagingSenderId: '885400763379',
    projectId: 'abc-chart-behavior-duo',
    storageBucket: 'abc-chart-behavior-duo.appspot.com',
    androidClientId: '885400763379-ie8t24dn12eu330i8upk8n01r7onf966.apps.googleusercontent.com',
    iosClientId: '885400763379-gm1816qro066knh6fbhr24t7tub7cpn0.apps.googleusercontent.com',
    iosBundleId: 'com.behaviorduo.abcchart',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPPCKtoWNkUa5qhxP1FdlXEl1hinX4FaE',
    appId: '1:885400763379:web:5a4174db3939e34944f086',
    messagingSenderId: '885400763379',
    projectId: 'abc-chart-behavior-duo',
    authDomain: 'abc-chart-behavior-duo.firebaseapp.com',
    storageBucket: 'abc-chart-behavior-duo.appspot.com',
  );

}