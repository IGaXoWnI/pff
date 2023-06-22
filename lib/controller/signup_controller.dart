import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/data/datasource/remote/auth/signup.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontrol.dart';
import '../view/Routing/App_route.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;

  late Statusrequest statusrequest;
  SignupData signupData = SignupData(Get.find());
  List data = [];

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      var response =
          await signupData.postData(username.text, email.text, password.text);
      statusrequest = handlingData(response);
      if (Statusrequest.succes == statusrequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          Get.toNamed(AppRoute.login.name);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "email already exists");
          statusrequest = Statusrequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoute.login.name);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
