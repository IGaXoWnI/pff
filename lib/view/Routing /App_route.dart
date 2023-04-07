import 'package:go_router/go_router.dart';
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

final goRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: AppRoute.onboarding.name,
      builder: (context, state) => Onbording(),
      routes: [
        GoRoute(
          path: 'login',
          name: AppRoute.login.name,
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: 'signup',
          name: AppRoute.signup.name,
          builder: (context, state) => Signup(),
        ),
        GoRoute(
          path: 'homepage',
          name: AppRoute.homepage.name,
          builder: (context, state) => Homepage(),
        ),
      ]),
]);
