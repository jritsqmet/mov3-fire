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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCsynZepPniUAWQsOwP5YLEuiV8jUKZxc',
    appId: '1:580578977514:web:3fb1ffd9b0d8ff1b9e1993',
    messagingSenderId: '580578977514',
    projectId: 'app-login-13c72',
    authDomain: 'app-login-13c72.firebaseapp.com',
    databaseURL: 'https://app-login-13c72-default-rtdb.firebaseio.com',
    storageBucket: 'app-login-13c72.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGon4HPj46Htc0pW_g2glkIo8dSQk9cF0',
    appId: '1:580578977514:android:7a6fb7dd52e11c979e1993',
    messagingSenderId: '580578977514',
    projectId: 'app-login-13c72',
    databaseURL: 'https://app-login-13c72-default-rtdb.firebaseio.com',
    storageBucket: 'app-login-13c72.appspot.com',
  );

}