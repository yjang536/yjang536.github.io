//import 'dart:io'; error in web

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:micromobitech/helper/binding.dart';
import 'package:micromobitech/control_pages.dart';
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/localuser_control.dart';
import 'package:flutter/foundation.dart';
import 'package:micromobitech/model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyABbMlXFWOm0Z813z2V_KpqFdoEYFicnRA",
          authDomain: "fir-auth-b2886.firebaseapp.com",
          projectId: "fir-auth-b2886",
          storageBucket: "fir-auth-b2886.appspot.com",
          messagingSenderId: "581104335572",
          appId: "1:581104335572:web:9b44fedf5d9f34106c9941",
          measurementId: "G-XT29V00L2X"),
    );
  } else {
    await Firebase.initializeApp();
  }

  if (FirebaseAuth.instance.currentUser != null) {
    globalUserModel = await LocalUserControl.getUserData();
  }
  await FirebaseAuth.instance.signOut();

//  await FirebaseAuth.instance.signInWithEmailAndPassword(
//    email: 'yjang536@gmail.com',
//    password: '123456',
//  );

  globalUserModel = UserModel.fromJson({
    "userId": "vgDVsEPm1nTXA7lvjsaIMeD1kv82",
    "email": "yjang536@gmail.com",
    "name": "aaa",
    "pic": "",
    "factoryId": "ju",
    "role": "",
    "fcm": ""
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => GetMaterialApp(
        defaultTransition: Transition.fade,
        initialBinding: Binding(),
        home: ControlPages(),
        title: 'micromobitech',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
