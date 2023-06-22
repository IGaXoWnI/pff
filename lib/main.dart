import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pff/binding/initialbinding.dart';
import 'view/Routing/App_route.dart';
import 'package:flutter/material.dart';

import 'view/screens/login.dart';

bool islogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Retrieve the FCM token
  // String? token = await FirebaseMessaging.instance.getToken();
  // print('FCM Token: $token'); // Print the token for testing purposes

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: islogin ? Home() : Login(),
      initialBinding: initialbinding(),
      initialRoute: AppPages.initial.toString(),
      getPages: AppPages.routes,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
