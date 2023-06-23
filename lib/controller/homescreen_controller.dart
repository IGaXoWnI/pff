import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pff/view/screens/user.dart';

import '../view/screens/cart.dart';
import '../view/screens/favorite.dart';
import '../view/screens/home.dart';

abstract class HomeScreenController extends GetxController {
  changeScreen(int currentscreen);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentscreen = 0;

  List<Widget> listScreen = [
    Home(),
    Favorite(),
    Cart(),
    UserMenu(),
  ];

  @override
  changeScreen(int i) {
    currentscreen = i;
    update();
  }
}
