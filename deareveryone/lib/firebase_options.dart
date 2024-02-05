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
    apiKey: 'AIzaSyBUWv8ju4oaDbhpjN641GuO4CLvbguGkG0',
    appId: '1:766945353082:web:9145856d7c11cc849acac3',
    messagingSenderId: '766945353082',
    projectId: 'dear-everyone',
    authDomain: 'dear-everyone.firebaseapp.com',
    storageBucket: 'dear-everyone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ6OFbEKwF4sFtPNxssjdJBdiWtc5Ui9g',
    appId: '1:766945353082:android:0b8b5811dcba6ae99acac3',
    messagingSenderId: '766945353082',
    projectId: 'dear-everyone',
    storageBucket: 'dear-everyone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCplKWRIbD3pvvlmu7WrjtFxHOr728adSQ',
    appId: '1:766945353082:ios:396e9936526503609acac3',
    messagingSenderId: '766945353082',
    projectId: 'dear-everyone',
    storageBucket: 'dear-everyone.appspot.com',
    iosBundleId: 'com.example.deareveryone',
  );
}
