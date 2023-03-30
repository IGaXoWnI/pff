// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Routing /App_route.dart';
import 'package:flutter/material.dart';

bool islogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => Aboutpage1(),
      //   "/about2": (context) => Aboutpage2(),
      //   "/about3": (context) => Aboutpage3(),
      //   "/login": (context) => Login(),
      //   "/signup": (context) => Signup(),
      //   "/homepage": (context) => Homepage(),

      // }
    );
  }
}
