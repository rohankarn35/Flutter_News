import 'package:flutter/material.dart';
import 'package:flutter_news/UI/widgets/customButton.dart';
import 'package:flutter_news/UI/widgets/customTextfield.dart';

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
                CustomButton().customButton("Login", () {}),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
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
