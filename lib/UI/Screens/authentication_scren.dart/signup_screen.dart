import 'package:flutter/material.dart';
import 'package:flutter_news/UI/widgets/customButton.dart';
import 'package:flutter_news/UI/widgets/customTextfield.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';
import 'package:flutter_news/services/firebaseService/firebaseAddUser.dart';
import 'package:flutter_news/services/firebaseService/signup_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _newPasswordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
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
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField().customTextField(
                  "Full Name",
                  const Icon(
                    Icons.person_2_rounded,
                    color: Colors.white,
                  ),
                  _fullNameTextEditingController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField().customTextField(
                    "Email",
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    _emailTextEditingController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField().customTextField(
                    "Create Password",
                    const Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                    ),
                    _newPasswordEditingController,
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField().customTextField(
                    "Confirm Password",
                    const Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                    ),
                    _confirmPasswordTextEditingController,
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                CustomButton().customButton("Sign Up", () async {
                  if (_confirmPasswordTextEditingController.text !=
                      _newPasswordEditingController.text) {
                    ToastMessage.showToast("Password Does Not Match");
                    return;
                  }
                  if (_confirmPasswordTextEditingController.text.isEmpty &&
                      _emailTextEditingController.text.isEmpty &&
                      _fullNameTextEditingController.text.isEmpty) {
                    ToastMessage.showToast("All Fields are Mandatory");
                    return;
                  }
                  final bool isLoggin = await SignUpService().signUpService(
                      _emailTextEditingController.text,
                      _confirmPasswordTextEditingController.text);
                  if (isLoggin) {
                    await FirebaseAddUser().addUser(
                        _emailTextEditingController.text,
                        _fullNameTextEditingController.text);
                    Navigator.pushNamed(context, '/login');
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
