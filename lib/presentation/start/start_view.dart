import 'package:flutter/material.dart';
import 'package:our_test_project/presentation/start/desktop_start_view.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';
import 'mobile_start_view.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);
  static const String routeName= "startView";
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopWidget: const DesktopStartView(),
      mobileWidget: const MobileStartView(),
    );
  }
}
