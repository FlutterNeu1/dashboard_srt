import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB01tFqwaNno-obXrlVFG8_JAzdZHBF9bk",
            authDomain: "srtgrocery-5482d.firebaseapp.com",
            projectId: "srtgrocery-5482d",
            storageBucket: "srtgrocery-5482d.appspot.com",
            messagingSenderId: "198575839668",
            appId: "1:198575839668:web:2cdbbc5eb0372b0f7cbae1",
            measurementId: "G-2LECKHV54J"));
  } else {
    await Firebase.initializeApp();
  }
}
