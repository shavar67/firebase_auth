import 'package:flutter/material.dart';

import '../authentication/authenticator.dart';
import '../constants.dart/router_constants.dart';
import '../screens/home_page.dart';
import '../screens/login.dart';
import '../screens/sign_up.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (context) => const Auth());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginWidget());
      case signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignUp());

      default:
        return MaterialPageRoute(builder: (context) => const LoginWidget());
    }
  }
}
