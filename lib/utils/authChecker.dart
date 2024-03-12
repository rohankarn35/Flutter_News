import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/homeScreen.dart';
import 'package:flutter_news/UI/Screens/authentication_scren.dart/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while checking auth status
        } else {
          final bool isLoggedIn = snapshot.data ?? false;
          return isLoggedIn ? HomeScreen() : LoginScreen();
        }
      },
    );
  }

  Stream<bool> _checkAuthStatus() async* {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    yield prefs.getBool("isLogginned") ?? false;
  }
}