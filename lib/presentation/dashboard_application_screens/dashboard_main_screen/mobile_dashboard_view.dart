import 'package:flutter/material.dart';

class MobileDashboardView extends StatelessWidget {
  static const String routeName = 'MobileDashBoardScreen';
  const MobileDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(child: Text("Mobile Screen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)));
  }
}
