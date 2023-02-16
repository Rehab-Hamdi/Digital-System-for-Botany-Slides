import 'package:flutter/material.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const String routeName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileWidget: const MobileLoginView(),
        desktopWidget: const DesktopLoginView(),
      ),
    );
  }
}
