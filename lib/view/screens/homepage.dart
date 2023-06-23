// ignore_for_file: deprecated_member_use, unused_import, unused_local_variable
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pff/controller/home_controller.dart';
import 'package:pff/controller/homescreen_controller.dart';
import 'package:pff/core/class/handlingdataview.dart';
import 'package:pff/core/shared/app_bar.dart';
import 'package:pff/core/shared/cycle.dart';
import 'package:pff/core/shared/offre.dart';
import 'package:pff/core/constants/appColors.dart';
import 'package:pff/core/shared/cardWidget.dart';
import 'package:pff/core/constants/imageAssets.dart';
import 'package:pff/view/screens/user.dart';
import 'package:pff/view/widgets/linkapi.dart';

import '../Routing/App_route.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controllerScreen =
        Get.put(HomeScreenControllerImp());

    var _textEditingController;
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controllerScreen) => Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 12,
              ),
              child: GNav(
                  backgroundColor: Colors.transparent,
                  activeColor: kPrimaryColor,
                  color: Colors.grey,
                  tabBackgroundColor: Color(0xffFFE8E0),
                  padding: EdgeInsets.all(18),
                  gap: 8,
                  tabs: [
                    GButton(
                        icon: Icons.home,
                        text: 'Home ',
                        onPressed: () {
                          controllerScreen.changeScreen(0);
                        }),
                    GButton(
                        icon: Icons.favorite_border,
                        text: 'Favorite',
                        onPressed: () {
                          controllerScreen.changeScreen(1);
                        }),
                    GButton(
                        icon: Icons.shopping_cart,
                        text: 'Cart',
                        onPressed: () {
                          controllerScreen.changeScreen(2);
                        }),
                    GButton(
                        icon: Icons.person_outline,
                        text: 'Account',
                        onPressed: () {
                          controllerScreen.changeScreen(3);
                        }),
                  ]),
            ),
            body: controllerScreen.listScreen
                .elementAt(controllerScreen.currentscreen)));
  }
}
