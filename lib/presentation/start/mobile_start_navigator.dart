import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/components/smallScreen_drawer_menu.dart';
import 'package:our_test_project/models/users.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileStartNavigator {
  static goToLogin(context) async{

      try {
        SharedPreferences prefs= await SharedPreferences.getInstance();
        int? user_id= prefs.getInt('user_id');
         Users data = await APIManager.getUserById(user_id!);
        String? userType = data.type;
        if (userType == 'admin') {
          Navigator.pushNamedAndRemoveUntil(context, DashBoardScreenController.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        }
      } catch (error) {
        print('Error fetching user type: $error');
        // Handle the error appropriately
      }
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    // return null;
  }
}
