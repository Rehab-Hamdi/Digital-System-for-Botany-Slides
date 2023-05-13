import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:sizer/sizer.dart';

class DesktopSettingsView extends StatefulWidget {
  static const String routeName = 'settingsView';

  const DesktopSettingsView({super.key});

  @override
  State<DesktopSettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<DesktopSettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 5.sp, color: Colors.black),
            ),
            leading: Icon(
              Icons.logout,
              size: 5.sp,
            ),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 5.sp),
                  ),
                  content: Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 5.sp)),
                  actions: [
                    TextButton(
                      child: Text('Cancel',
                          style:
                              TextStyle(fontSize: 4.sp, color: Colors.green)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                        child: Text('Logout',
                            style:
                                TextStyle(fontSize: 4.sp, color: Colors.red)),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          //MobileLoginView.isViewed=0;
                          Navigator.pushReplacementNamed(
                              context, LoginView.routeName);
                        }),
                  ],
                ),
              );
            },
          ),
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.74,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/plant1.png",
              ),
              Image.asset("assets/images/plant1.png")
            ],
          ),
        ],
      )),
    );
  }
}
