import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'view/Routing/App_route.dart';
import 'package:flutter/material.dart';

bool islogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Retrieve the FCM token
  String? token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token'); // Print the token for testing purposes

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
