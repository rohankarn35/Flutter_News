import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_news/UI/widgets/customToast.dart';

class SignUpService {
  Future<bool> signUpService(String email, String password) async {
    try {
      final UserCredential? credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        ToastMessage.showToast("User Created");
        return true;
      } else {
        return false; // Handle unexpected cases where credential is null
      }
    } on FirebaseAuthException catch (e) {
      String message = "";
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        default:
          message = "An error occurred during registration. Please try again.";
      }
      ToastMessage.showToast(message);
      return false;
    } catch (e) {
      // Handle unexpected errors
      ToastMessage.showToast("An unexpected error occurred. Please try again.");
      return false;
    }
  }
}
