import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Botany/presentation/auth/login/login_view.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = 'settingsView';

  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.logout,
                size: 22,
              ),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                    content: Text('Are you sure you want to logout?',
                        style: TextStyle(fontSize: 16)),
                    actions: [
                      TextButton(
                        child: Text('Cancel',
                            style:
                                TextStyle(fontSize: 16, color: Colors.green)),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                          child: Text('Logout',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.red)),
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
          ),
        ],
      )),
    );
  }
}
