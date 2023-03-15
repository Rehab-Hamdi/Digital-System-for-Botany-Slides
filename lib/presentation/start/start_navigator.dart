import 'package:flutter/cupertino.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';

class StartNavigator {
  static VoidCallback? goToLogin(context) {
    Navigator.pushReplacementNamed(context, LoginView.routeName);
    return null;
  }
}
