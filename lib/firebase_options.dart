import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAfiOruCkibU59Dx_Kr0g6D8ZTb8t3I1Pc',
    appId: '1:350949636849:android:ca44a01cde2b42bc9d8750',
    messagingSenderId: '350949636849',
    projectId: 'decarbonus-c1037',
    databaseURL: 'https://decarbonus-c1037-default-rtdb.firebaseio.com',
    storageBucket: 'decarbonus-c1037.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlsLTAYrIWBoMRSRWywFNCO1FmrprsCBU',
    appId: '1:350949636849:ios:a2cd1f26aec29b789d8750',
    messagingSenderId: '350949636849',
    projectId: 'decarbonus-c1037',
    databaseURL: 'https://decarbonus-c1037-default-rtdb.firebaseio.com',
    storageBucket: 'decarbonus-c1037.appspot.com',
    iosClientId: '350949636849-8oj2bmm482t8109nlorqldems4evl621.apps.googleusercontent.com',
    iosBundleId: 'com.example.decarbonus',
  );
}
