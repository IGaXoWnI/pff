import 'package:get/get.dart';
import 'package:pff/view/screens/Onboarding.dart';
import 'package:pff/view/screens/boxs.dart';
import 'package:pff/view/screens/cart.dart';
import 'package:pff/view/screens/favorite.dart';
import 'package:pff/view/screens/homepage.dart';
import 'package:pff/view/screens/login.dart';
import 'package:pff/view/screens/signup.dart';
import 'package:pff/view/screens/user.dart';

enum AppRoute {
  onboarding,
  login,
  signup,
  homepage,
  favorite,
  cart,
  usermenu,
  boxs
}

class AppPages {
  static const initial = AppRoute.onboarding;

  static final routes = [
    GetPage(
      name: _Paths.onboarding,
      page: () => Onbording(),
      children: [
        GetPage(
          name: _Paths.login,
          page: () => Login(),
        ),
        GetPage(
          name: _Paths.signup,
          page: () => Signup(),
        ),
        GetPage(
          name: _Paths.homepage,
          page: () => Homepage(),
        ),
        GetPage(
          name: _Paths.favorite,
          page: () => Favorite(),
        ),
        GetPage(
          name: _Paths.cart,
          page: () => Cart(),
        ),
        GetPage(
          name: _Paths.usermenu,
          page: () => UserMenu(),
        ),
        GetPage(
          name: _Paths.boxs,
          page: () => Boxs(),
        ),
      ],
    ),
  ];
}

abstract class _Paths {
  static const onboarding = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const homepage = '/homepage';
  static const favorite = "/favorite";
  static const cart = "/cart";
  static const usermenu = "/usermenu";
  static const boxs = "/boxs";
}
