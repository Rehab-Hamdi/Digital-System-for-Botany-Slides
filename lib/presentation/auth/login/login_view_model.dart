import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/constants.dart';
import 'package:Botany/database_models/GetUserByEmail.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:Botany/presentation/user_application_screens/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        //navigator!.showMessage(message, true);
        navigator?.goToHome();
      }
    else {
      navigator!.hideLoading();
      navigator!.showMessage(message, false);
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

  pushScreenBasedOnEmail(String email, BuildContext context) async{
    try {
      GetUserByEmail data = await APIManager.getUserByEmail(email);
      if(data.message=='User not found')
        {
          return Center(
            child: Text(data.message!, style: TextStyle(color: Colors.red),),
          );
        }
      String? userType = data.type;
      int? user_id= data.id;
      int? user_state= data.blocked;
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setInt('user_id', user_id!);
      if(user_state==0|| user_state==null) {
        if (userType == 'admin') {
          Navigator.pushNamedAndRemoveUntil(
              context, DashBoardScreenController.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        }
      }
      else
      {
        showDialog(
            context: context,
            builder: (c) {
              return AlertDialog(
                title: Text('You are blocked!' ,style: TextStyle(color:
                Colors.red.shade400, fontSize: 18),),
                content: Text('Please contact the administrator to address this issue.'),
                actions: [
                  Center(child: IconButton( onPressed: (){Navigator.of(context).pop(); }, icon: const Icon(Icons.cancel, color:Colors.black,),))
                ],
              );
            });
        FirebaseAuth.instance.signOut();
      }
    } catch (error) {
      print('Error fetching user type: $error');
      // Handle the error appropriately
    }
  }

}
