import 'package:firebase_auth/firebase_auth.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/constants.dart';
import 'package:Botany/presentation/dashboard_application_screens/add_user/add_user_navigator.dart';


class AddUserViewModel extends BaseViewModel<AddUserNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void createUser(String email, String password) async {
    String message = "null";
    try {
      navigator!.showLoading();
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      message = "account created successfully.";
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.WEEK_PASSWORD) {
        message = "The password is too weak.";
      } else if (e.code == FireBaseErrors.EMAIL_IN_USE) {
        message = "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
    }
    if(message=="account created successfully.")
    {
      navigator!.hideLoading();
      navigator!.showMessage(message, true);
    }
    else {
      navigator!.hideLoading();
      navigator!.showMessage(message, false);
    }
  }

  String? userNameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your userName';
    }
    return null;
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

  String? phoneValidation(text) {
    bool phoneValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter your Phone Number';
    } else if (text.length < 11 || text.length > 11) {
      return 'phone number must be exactly 11 number';
    } else if (!phoneValid) {
      return 'phone number must contain only numbers';
    }
    return null;
  }

}