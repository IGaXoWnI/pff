// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/controller/login_controller.dart';
import 'package:pff/core/constants/imageAssets.dart';
import 'package:pff/core/functions/validinput.dart';
import 'package:pff/core/shared/button.dart';
import 'package:pff/core/shared/textfield.dart';

class Login extends StatelessWidget {
  var myemail, mypassword;

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                AppImages.logo,
                width: 84,
                height: 92,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Log In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    Textf(
                      mycontroller: controller.email,
                      hint: 'Email',
                      ispasssword: false,
                      path: AppIcons.message,
                      // onsave: (val) {
                      //   myemail = val;
                      //   return null;
                      // },
                      validator: (val) {
                        return validinput(val!, 5, 100, "email");
                      },
                    ),
                    Textf(
                      mycontroller: controller.password,
                      hint: 'Password',
                      path: AppIcons.lock,
                      ispasssword: true,
                      // onsave: (val) {
                      //   mypassword = val;
                      //   return null;
                      // },
                      validator: (val) {
                        return validinput(val!, 5, 100, "password");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Forgot password?',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30,
              ),
              Btn(
                btntext: 'Log In',
                horizontal: 90,
                raduis: 60,
                vertical: 25,
                size: 20,
                onPressed: () {
                  controller.login();
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    child: Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(35, 46, 36, 0.6),
                      ),
                    ),
                  ),
                  Text(
                    "   Or   ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(35, 46, 36, 0.6),
                    ),
                  ),
                  Container(
                    width: 120,
                    child: Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(35, 46, 36, 0.6),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppIcons.fb),
                    GestureDetector(
                      child: Image.asset(AppIcons.google),
                      onTap: () {
                        // Handle Google sign-in here
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Text(
                      'Don’t have an account ?',
                      style: TextStyle(
                        color: Color.fromRGBO(28, 26, 25, 0.5),
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.goToSignUp(),
                      child: Text(
                        ' Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
