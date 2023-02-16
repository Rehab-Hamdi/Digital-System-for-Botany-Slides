import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
  Widget? desktopWidget;

  ResponsiveLayout({super.key, required this.mobileWidget, this.desktopWidget});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 480) {
          return desktopWidget ?? mobileWidget;
        } else {
          return mobileWidget;
        }
      },
    );
  }
}
