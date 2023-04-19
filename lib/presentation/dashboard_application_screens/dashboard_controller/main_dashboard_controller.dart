import 'package:flutter/material.dart';
import 'package:our_test_project/core/components/desktop_drawer_menu.dart';
import 'package:our_test_project/core/components/smallScreen_drawer_menu.dart';
import 'package:our_test_project/utils/responsive.dart';

class DashBoardScreenController extends StatelessWidget {
  static const String routeName = 'DashBoardScreen';

  const DashBoardScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveWidget.isDestop(context)
                ? const Expanded(child: DesktopDrawerMenu())
                : Expanded(child: MobileDrawerMenu()),
          ],
        ),
      ),
    );
  }
}
