import 'package:flutter/material.dart';
import 'package:Botany/presentation/auth/login/desktop_login_view.dart';
import 'package:Botany/presentation/auth/login/mobile_login_view.dart';
import 'package:Botany/utils/responsiveLayout.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const String routeName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileWidget:  MobileLoginView(),
        desktopWidget: const DesktopLoginView(),
      ),
    );
  }
}
