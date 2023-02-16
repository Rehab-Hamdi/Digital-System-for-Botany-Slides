import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/colors.dart';
import 'package:our_test_project/core/custom_widgets/password_field.dart';
import 'package:our_test_project/core/custom_widgets/text_field.dart';
import 'package:our_test_project/presentation/auth/home/home_view.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';
import 'login_navigator.dart';
import 'login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const String routeName = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResposiveLayout(
        mobileWidget: const MobileLoginView(),
        desktopWidget: const DesktopLoginView(),
      ),
    );
  }
}
