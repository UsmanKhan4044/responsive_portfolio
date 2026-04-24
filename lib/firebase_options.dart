import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
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
        return linux;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:web:fab1660b83cb19887ba1bb',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    authDomain: 'responsive-portfolio-9ed1e.firebaseapp.com',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
    measurementId: 'G-Y3Y0KD3JTG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:android:abcdef123456',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:ios:abcdef123456',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
    iosClientId: '1234567890-abcdefghijklmnopqrstuvwxyz.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterProfile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:macos:abcdef123456',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:windows:abcdef123456',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyDCD2lxTidkS_zk5GwaiS8RWgF_TBkYvhY',
    appId: '1:67910203874:linux:abcdef123456',
    messagingSenderId: '67910203874',
    projectId: 'responsive-portfolio-9ed1e',
    storageBucket: 'responsive-portfolio-9ed1e.firebasestorage.app',
  );
}