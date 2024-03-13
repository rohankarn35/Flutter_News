import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/UI/widgets/customButton.dart';
import 'package:flutter_news/UI/widgets/customTextfield.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';
import 'package:flutter_news/services/firebaseService/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0), // Adjust top padding as needed
          child: Text("Flutter News", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color.fromARGB(255, 2, 18, 46),
      ),
      backgroundColor: Color.fromARGB(255, 2, 18, 46),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                CustomTextField().customTextField(
                    "Email",
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    _emailTextEditingController),
                const SizedBox(height: 20),
                CustomTextField().customTextField(
                    "Password",
                    const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    _passwordTextEditingController,
                    obscureText: true),
                const SizedBox(height: 10),
                const SizedBox(height: 15),
                CustomButton().customButton("Login", () async {
                  if (_emailTextEditingController.text.isEmpty && _passwordTextEditingController.text.isEmpty) {
                    ToastMessage.showToast("All Fields are mandatory");
                    return;
                    
                  }
                  final UserCredential? credential = await LoginService()
                      .loginService(_emailTextEditingController.text,
                          _passwordTextEditingController.text);
                 if (credential!=null) {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool("isLogginned", true);
                  prefs.setString("email", _emailTextEditingController.text);
                  Navigator.pushReplacementNamed(context, '/home');
                   
                 }
                }),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
