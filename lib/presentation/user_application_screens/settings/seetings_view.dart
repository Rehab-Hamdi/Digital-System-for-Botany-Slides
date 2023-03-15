import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';

class SettingsView extends StatelessWidget {

  static const String routeName = 'settingsView';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:Center(
          child: Text("Settings", style: TextStyle(fontSize:25, color: MyColors.green),),
        )
    );
  }
}
