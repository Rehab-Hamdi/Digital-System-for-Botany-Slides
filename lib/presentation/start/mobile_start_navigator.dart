import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/components/smallScreen_drawer_menu.dart';
import 'package:Botany/database_models/GetUserByEmail.dart';
import 'package:Botany/database_models/users.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:Botany/presentation/user_application_screens/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileStartNavigator {
  static goToLogin(context) async{
      try {
        SharedPreferences prefs= await SharedPreferences.getInstance();
        int? user_id= prefs.getInt('user_id');
         Users data = await APIManager.getUserById(user_id!);
        String? userType = data.type;
        int? blockedState= data.blocked!;
        if(blockedState==0) {
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
                    Colors.red.shade400, fontSize: 15),),
                    content: Text('Please contact the administrator to address this issue.'),
                    actions: [
                      Center(child: IconButton( onPressed: (){Navigator.of(context).pop(); }, icon: const Icon(Icons.cancel, color:Colors.black,),))
                    ],
                  );
                });
          }
      } catch (error) {
        print('Error fetching user type: $error');
        // Handle the error appropriately
      }
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    // return null;
  }

  static pushScreenBasedOnEmail(String email, BuildContext context) async{
    try {
      GetUserByEmail data = await APIManager.getUserByEmail(email);
      if(data.message=='User not found')
      {
        return Center(
          child: Text(data.message!, style: TextStyle(color: Colors.red),),
        );
      }
      String? userType = data.type;
        if (userType == 'admin') {
          Navigator.pushNamedAndRemoveUntil(
              context, DashBoardScreenController.routeName, (route) => false);
        } else {
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  content: const Text(
                    'The email used is not associated with an admin account.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    Center(child: IconButton( onPressed: (){Navigator.of(context).pop(); }, icon: const Icon(Icons.cancel, color:Colors.black,),))
                  ],
                );
              });


    }
    } catch (error) {
      print('Error fetching user type: $error');
      // Handle the error appropriately
    }
  }
}
