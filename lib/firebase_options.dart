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
    apiKey: 'AIzaSyAl2-Zzl_U1aUNMP_eQPkQg1E5CFjC8jTI',
    appId: '1:843505644448:web:061107518371345ce1aac5',
    messagingSenderId: '843505644448',
    projectId: 'dam-u4-proyecto2-19400633',
    authDomain: 'dam-u4-proyecto2-19400633.firebaseapp.com',
    storageBucket: 'dam-u4-proyecto2-19400633.appspot.com',
    measurementId: 'G-C9WJF38F5F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5TuHDBmdVvmxGD1-gqCFpQs1z_q2V7gk',
    appId: '1:843505644448:android:9220c8425973cb8ee1aac5',
    messagingSenderId: '843505644448',
    projectId: 'dam-u4-proyecto2-19400633',
    storageBucket: 'dam-u4-proyecto2-19400633.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQSmXuizayRjLHSBd-PdZzKCDc0HZ-ynI',
    appId: '1:843505644448:ios:a2753ff1356b1d3de1aac5',
    messagingSenderId: '843505644448',
    projectId: 'dam-u4-proyecto2-19400633',
    storageBucket: 'dam-u4-proyecto2-19400633.appspot.com',
    iosClientId: '843505644448-nc51qp43io528u4ied8a7a1qsnuohoe3.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto219400633',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQSmXuizayRjLHSBd-PdZzKCDc0HZ-ynI',
    appId: '1:843505644448:ios:a2753ff1356b1d3de1aac5',
    messagingSenderId: '843505644448',
    projectId: 'dam-u4-proyecto2-19400633',
    storageBucket: 'dam-u4-proyecto2-19400633.appspot.com',
    iosClientId: '843505644448-nc51qp43io528u4ied8a7a1qsnuohoe3.apps.googleusercontent.com',
    iosBundleId: 'mx.edu.ittepic.damU4Proyecto219400633',
  );
}
