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
    apiKey: 'AIzaSyDsM0srIBtTvSQzec5AxPpjK3h1W8fsXIM',
    appId: '1:1079840652534:web:d34040ccabf44006cfc0d7',
    messagingSenderId: '1079840652534',
    projectId: 'e-commerce-7c085',
    authDomain: 'e-commerce-7c085.firebaseapp.com',
    databaseURL: 'https://e-commerce-7c085-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-7c085.appspot.com',
    measurementId: 'G-L8TY08S4SH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8I0x0IGOf6s9ZvCmgwL64utKRfjDzaP0',
    appId: '1:1079840652534:android:9b022fbe2c86e194cfc0d7',
    messagingSenderId: '1079840652534',
    projectId: 'e-commerce-7c085',
    databaseURL: 'https://e-commerce-7c085-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-7c085.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTdWs4sH7dB12CEuHXXuottD-XkOcmHYA',
    appId: '1:1079840652534:ios:7f4efda9f7a257a4cfc0d7',
    messagingSenderId: '1079840652534',
    projectId: 'e-commerce-7c085',
    databaseURL: 'https://e-commerce-7c085-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-7c085.appspot.com',
    iosBundleId: 'com.example.fruitECommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTdWs4sH7dB12CEuHXXuottD-XkOcmHYA',
    appId: '1:1079840652534:ios:c538730b70cccf82cfc0d7',
    messagingSenderId: '1079840652534',
    projectId: 'e-commerce-7c085',
    databaseURL: 'https://e-commerce-7c085-default-rtdb.firebaseio.com',
    storageBucket: 'e-commerce-7c085.appspot.com',
    iosBundleId: 'com.example.fruitECommerce.RunnerTests',
  );
}
