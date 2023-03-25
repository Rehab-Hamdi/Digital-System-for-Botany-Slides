import 'package:flutter/cupertino.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';
import 'package:our_test_project/presentation/user_application_screens/home/mobile_home_view.dart';

class MobileStartNavigator {
  static VoidCallback? goToLogin(context) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    return null;
  }
}