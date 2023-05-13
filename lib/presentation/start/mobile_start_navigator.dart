import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/core/components/smallScreen_drawer_menu.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';

class MobileStartNavigator {
  static VoidCallback? goToLogin(context) {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text('Choose Page'),
            content: Text(
              'Do you want to choose user screen or dashboard screen ?',
              style: TextStyle(fontSize: 17),
            ),
            actions: [
              WillPopScope(
                onWillPop: () async {
                  return false; // Prevents closing the dialog by pressing the back button
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        },
                        child: Text('User Application'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, MobileDrawerMenu.routeName);
                        },
                        child: Text('Dashboard Application'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });

    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    // return null;
  }
}
