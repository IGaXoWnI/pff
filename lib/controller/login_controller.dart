// ignore_for_file: unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/core/class/statusrequest.dart';
import 'package:pff/core/functions/handlingdatacontrol.dart';
import 'package:pff/core/services/services.dart';
import 'package:pff/data/datasource/remote/auth/login.dart';

import '../view/Routing/App_route.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  MyServices myServices = Get.find();

  Statusrequest? statusrequest;
  LoginData loginData = LoginData(Get.find());

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;

      var response = await loginData.postData(email.text, password.text);
      statusrequest = handlingData(response);
      if (Statusrequest.succes == statusrequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          myServices.sharedPreferences
              .setInt("id", response["data"]["users_id"]);
          myServices.sharedPreferences
              .setString("username", response["data"]["users_name"]);
          myServices.sharedPreferences
              .setString("email", response["data"]["users_email"]);

          Get.offNamed(AppRoute.homepage.name);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "email or password not correct");
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signup.name);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
