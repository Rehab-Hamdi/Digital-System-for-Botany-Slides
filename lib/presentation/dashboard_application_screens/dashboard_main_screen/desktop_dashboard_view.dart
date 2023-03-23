import 'package:flutter/material.dart';
class DesktopDashboardView extends StatelessWidget
{
  static const String routeName = 'DashboardContentScreen';

  const DesktopDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text('Main Screen'),)
            ],
          ),
        ),
      ),
    );
  }

}