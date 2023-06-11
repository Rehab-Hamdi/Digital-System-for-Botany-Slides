import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/constants.dart';
import 'package:Botany/database_models/users.dart';
import 'package:Botany/presentation/dashboard_application_screens/users/users_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends BaseViewModel<UserNavigator>{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> createNewUser(Users? user, BuildContext context) async {
    String message = "Duplicate Data Error...!";
    try {
      navigator!.showLoading();
      await firebaseAuth.createUserWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      message = "account created successfully..!";
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.WEEK_PASSWORD) {
        message = "The password is too weak.";
      } else if (e.code == FireBaseErrors.EMAIL_IN_USE) {
        message = "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
    }
    if(message == "account created successfully..!")
    {
      navigator!.hideLoading();
      APIManager.addNewUserRequest(user!);
      //Navigator.pop(context);
      navigator!.hideLoading();
      navigator!.showDialogWithGif(
        img: "assets/images/success.gif",
        title: "User added successfully..!",
        titleColor: Colors.green,
      );
    }
    else {
      navigator!.hideLoading();
      navigator!.showMessage(message,false);
    }
  }

  Future<void> updateUserInfo(Users? user, BuildContext context) async {
    navigator!.showLoading();
    APIManager.updateUserRequest(user!);
    Navigator.pop(context);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
        img: "assets/images/success.gif",
        title: "User updated successfully..!",
        titleColor: Colors.green,
    );
  }

  Future<void> deleteUserById(String? id, BuildContext context) async {
    navigator!.showLoading();
    APIManager.deleteUserRequest(id!);
    Navigator.pop(context);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "User deleted successfully..!",
      titleColor: Colors.green,
    );
  }

  String? userNameValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user userName';
    }
    return null;
  }
  String? emailValidation(text) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user email';
    } else if (!emailValid) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }
  String? passwordValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user Password';
    } else if (text.length < 9) {
      return 'Password must be at least 9 characters';
    }
    return null;
  }
  String? phoneValidation(text) {
    bool phoneValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user Phone Number';
    } else if (text.length < 11 || text.length > 11) {
      return 'phone number must be exactly 11 number';
    } else if (!phoneValid) {
      return 'phone number must contain only numbers';
    }
    return null;
  }
  String? ssnValidation(text) {
    bool ssnValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,14}$)').hasMatch(text!);
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user SSN Number';
    } else if (text.length < 14 || text.length > 14) {
      return 'SSN number must be exactly 14 number';
    } else if (!ssnValid) {
      return 'SSN number must contain only numbers';
    }
    return null;
  }
  String? idValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user id';
    }
    return null;
  }
}