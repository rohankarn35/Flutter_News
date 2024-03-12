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
    apiKey: 'AIzaSyDjLdoz5N857bp40fdM7uevUnutSLidUAA',
    appId: '1:1076192918136:web:1f9afa928f878593034b8d',
    messagingSenderId: '1076192918136',
    projectId: 'flutter-news-67583',
    authDomain: 'flutter-news-67583.firebaseapp.com',
    storageBucket: 'flutter-news-67583.appspot.com',
    measurementId: 'G-F2R17JGMGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNXMZ50jT3_WXfvbd2rdvPLGWqUMhG1tQ',
    appId: '1:1076192918136:android:98126969eedd0fcf034b8d',
    messagingSenderId: '1076192918136',
    projectId: 'flutter-news-67583',
    storageBucket: 'flutter-news-67583.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpcYdZkDO37AirkuNMrPFEqmiVxnTO8CQ',
    appId: '1:1076192918136:ios:f94328280101b00b034b8d',
    messagingSenderId: '1076192918136',
    projectId: 'flutter-news-67583',
    storageBucket: 'flutter-news-67583.appspot.com',
    iosBundleId: 'com.example.flutterNews',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpcYdZkDO37AirkuNMrPFEqmiVxnTO8CQ',
    appId: '1:1076192918136:ios:1ef7611705cf9f79034b8d',
    messagingSenderId: '1076192918136',
    projectId: 'flutter-news-67583',
    storageBucket: 'flutter-news-67583.appspot.com',
    iosBundleId: 'com.example.flutterNews.RunnerTests',
  );
}
