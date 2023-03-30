// ignore_for_file: prefer_const_constructors, avoid_print, await_only_futures, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Routing //App_route.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                context.goNamed(AppRoute.login.name);
              },
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Text('Welcome to your account '),
      ),
    );
  }
}
