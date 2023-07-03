import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDx9YR0j3MZXqb8atKgnA1K6_GG7quwFwY",
            authDomain: "rmd-ff-project.firebaseapp.com",
            projectId: "rmd-ff-project",
            storageBucket: "rmd-ff-project.appspot.com",
            messagingSenderId: "1087039432055",
            appId: "1:1087039432055:web:451f28b50a9c3e7f45ad72",
            measurementId: "G-VZ00XFFM5D"));
  } else {
    await Firebase.initializeApp();
  }
}
