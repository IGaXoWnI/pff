// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/controller/signup_controller.dart';
import 'package:pff/core/functions/validinput.dart';
import 'package:pff/core/shared/button.dart';
import 'package:pff/core/shared/textfield.dart';

class Signup extends StatelessWidget {
  final bool isChecked = true;

  Signup({Key? key}) : super(key: key);

  var myname, myemail, mypassword;

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    var isChecked;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/logo.png',
                width: 84,
                height: 92,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    Textf(
                      mycontroller: controller.username,
                      hint: 'Name',
                      ispasssword: false,
                      path: 'assets/Icons/Profile.png',
                      validator: (val) {
                        return validinput(val!, 3, 20, "username");
                      },
                      onsave: (val) {
                        myname = val;
                        return null;
                      },
                    ),
                    Textf(
                      mycontroller: controller.email,
                      hint: 'Email',
                      path: 'assets/Icons/Message.png',
                      ispasssword: false,
                      validator: (val) {
                        return validinput(val!, 5, 100, "email");
                      },
                      onsave: (val) {
                        myemail = val;
                        return null;
                      },
                    ),
                    Textf(
                      mycontroller: controller.password,
                      hint: 'Password',
                      path: 'assets/Icons/Lock.png',
                      ispasssword: true,
                      validator: (val) {
                        return null;
                      },
                      onsave: (val) {
                        return validinput(val!, 5, 30, "password");
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      title: const Text('I accept all the Terms & Conditions'),
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        (Null Function() param0) {}(() {
                          isChecked = newValue;
                        });
                      },
                      activeColor: Color.fromRGBO(246, 121, 82, 1),
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Btn(
                btntext: 'Sign up',
                horizontal: 90,
                raduis: 60,
                vertical: 25,
                size: 20,
                onPressed: () async {
                  controller.signup();
                },
              ),
              SizedBox(
                height: 30,
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/Icons/fb.png'),
                    Image.asset('assets/Icons/google.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Color.fromRGBO(28, 26, 25, 0.5),
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.goToLogin(),
                      child: Text(
                        ' Log In',
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
