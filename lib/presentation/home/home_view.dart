import 'package:flutter/material.dart';
import 'package:our_test_project/presentation/home/desktop_home_view.dart';
import 'package:our_test_project/presentation/home/mobile_home_view.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName= "homeView";
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktopWidget: const DesktopHomeView(),
      mobileWidget: const MobileHomeView(),
    );
  }
}
