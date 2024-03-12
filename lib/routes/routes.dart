import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/homeScreen.dart';
import 'package:flutter_news/UI/Screens/authentication_scren.dart/login_screen.dart';
import 'package:flutter_news/UI/Screens/authentication_scren.dart/signup_screen.dart';
import 'package:flutter_news/utils/authChecker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteManager {
  static const String Home = "/";
  static const String Login = "/login";
  static const String SignUp = "/signup";
  static const String News = '/home';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home:
        return MaterialPageRoute(builder: (_) => AuthChecker());
      case Login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SignUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case News:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
