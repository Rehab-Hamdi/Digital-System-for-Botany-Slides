import 'package:flutter/cupertino.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:our_test_project/presentation/user_application_screens/home/mobile_home_view.dart';

class DesktopStartNavigator {
  static VoidCallback? goToLogin(context) {
    Navigator.pushReplacementNamed(context, DashBoardScreenController.routeName);
    return null;
  }
}