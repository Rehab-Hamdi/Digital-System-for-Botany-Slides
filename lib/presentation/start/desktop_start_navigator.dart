import 'package:flutter/cupertino.dart';
import 'package:Botany/presentation/auth/login/login_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:Botany/presentation/user_application_screens/home/mobile_home_view.dart';

class DesktopStartNavigator {
  static VoidCallback? goToLogin(context) {
    Navigator.pushReplacementNamed(context, DashBoardScreenController.routeName);
    return null;
  }
}