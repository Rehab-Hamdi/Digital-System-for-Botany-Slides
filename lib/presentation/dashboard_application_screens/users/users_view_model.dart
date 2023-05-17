import 'package:flutter/material.dart';
import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/models/users.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_navigator.dart';

class UsersViewModel extends BaseViewModel<UserNavigator>{
  void createNewUser(Users? user, BuildContext context){
    navigator!.showLoading();
    APIManager.addNewUserRequest(user!);
    Navigator.pop(context);
    navigator!.hideLoading();
    navigator!.showDialogWithGif(
      img: "assets/images/success.gif",
      title: "User added successfully..!",
      titleColor: Colors.green,
    );
  }
  void updateUserInfo(Users? user, BuildContext context){
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
  void deleteUserById(String? id, BuildContext context){
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
  String? idValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user id';
    }
    return null;
  }
  String? blockedStatusValidation(text) {
    if (text == null || text.trim().isEmpty) {
      return 'Please enter user block status';
    }
    else if(text != '0' && text != '1'){
      return 'only 0 for unBlock or 1 for block allowed';
    }
    return null;
  }
}