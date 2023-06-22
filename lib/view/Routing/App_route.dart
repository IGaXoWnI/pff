import 'package:get/get.dart';
import 'package:pff/view/screens/Onboarding.dart';
import 'package:pff/view/screens/homepage.dart';
import 'package:pff/view/screens/login.dart';
import 'package:pff/view/screens/signup.dart';

enum AppRoute {
  onboarding,
  login,
  signup,
  homepage,
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
      ],
    ),
  ];
}

abstract class _Paths {
  static const onboarding = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const homepage = '/homepage';
}
