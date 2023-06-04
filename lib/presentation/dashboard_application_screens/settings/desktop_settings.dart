import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Botany/presentation/auth/login/login_view.dart';

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
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            leading: Icon(
              Icons.logout,
              size: 21,
            ),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 21),
                  ),
                  content: Text('Are you sure you want to logout?',
                      style: TextStyle(fontSize: 17)),
                  actions: [
                    TextButton(
                      child: Text('Cancel',
                          style:
                              TextStyle(fontSize: 15, color: Colors.green)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                        child: Text('Logout',
                            style:
                                TextStyle(fontSize: 15, color: Colors.red)),
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
            height: MediaQuery.of(context).size.height * 0.68,
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
