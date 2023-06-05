import 'package:flutter/material.dart';
import 'package:Botany/presentation/start/desktop_start_view.dart';
import 'package:Botany/utils/responsiveLayout.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
