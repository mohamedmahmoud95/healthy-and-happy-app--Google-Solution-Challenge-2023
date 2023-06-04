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
    apiKey: 'AIzaSyAc3yWidNL4cCmb1BTLXqftbmqSumRsiDw',
    appId: '1:1068981377080:web:9b4e879db11694bc342ecd',
    messagingSenderId: '1068981377080',
    projectId: 'healthy-and-happy-b85cc',
    authDomain: 'healthy-and-happy-b85cc.firebaseapp.com',
    storageBucket: 'healthy-and-happy-b85cc.appspot.com',
    measurementId: 'G-MDWZFJCKZ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4AEptuIJXm0BsQ1Bo8f8-CZANzVd9q3w',
    appId: '1:1068981377080:android:582f49b311e9ccd3342ecd',
    messagingSenderId: '1068981377080',
    projectId: 'healthy-and-happy-b85cc',
    storageBucket: 'healthy-and-happy-b85cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQWFwXh6mTG6F9ZhR35iDfUKBJHkvI-bU',
    appId: '1:1068981377080:ios:8666eaf4ef29826c342ecd',
    messagingSenderId: '1068981377080',
    projectId: 'healthy-and-happy-b85cc',
    storageBucket: 'healthy-and-happy-b85cc.appspot.com',
    androidClientId: '1068981377080-d7n5jr3r43731ta3lnfjpc9b9vut68q1.apps.googleusercontent.com',
    iosClientId: '1068981377080-6d25io00r7utvat63tdk7k5987jujaa4.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentalHealthApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQWFwXh6mTG6F9ZhR35iDfUKBJHkvI-bU',
    appId: '1:1068981377080:ios:8666eaf4ef29826c342ecd',
    messagingSenderId: '1068981377080',
    projectId: 'healthy-and-happy-b85cc',
    storageBucket: 'healthy-and-happy-b85cc.appspot.com',
    androidClientId: '1068981377080-d7n5jr3r43731ta3lnfjpc9b9vut68q1.apps.googleusercontent.com',
    iosClientId: '1068981377080-6d25io00r7utvat63tdk7k5987jujaa4.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentalHealthApp',
  );
}