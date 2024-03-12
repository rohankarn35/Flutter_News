import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';

class LoginService {
  Future<UserCredential?> loginService(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ToastMessage.showToast("Login Sucessfull");

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ToastMessage.showToast("User not found");
      } else if (e.code == 'wrong-password') {
        ToastMessage.showToast("Wrong Password");
      } else {
        ToastMessage.showToast("Check email and password");
      }
    } catch (e) {
      ToastMessage.showToast("Error in login");
    }
    return null;
  }
}
