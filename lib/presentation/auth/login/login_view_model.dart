import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/constants.dart';
import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  login(String email, String password) async {
    String message = "This email or password is not exist";
    try {
      navigator!.showLoading();
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      message = "login successfully.";
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.WEEK_PASSWORD) {
        message = "The password provided is too weak.";
      } else if (e.code == FireBaseErrors.EMAIL_IN_USE) {
        message = "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
    }
    if(message=="login successfully.")
      {
        navigator!.hideLoading();
        navigator!.showMessage(message);
        navigator?.goToHome();
      }
    else {
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }
  }

  String? emailValidation(text) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!emailValid) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  String? passwordValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your Password';
    } else if (text.length < 9) {
      return 'Password must be at least 9 characters';
    }
    return null;
  }

}
