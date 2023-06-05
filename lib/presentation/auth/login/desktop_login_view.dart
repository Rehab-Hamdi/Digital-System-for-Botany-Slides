import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/button.dart';
import 'package:Botany/core/components/desktop_drawer_menu.dart';
import 'package:Botany/core/custom_widgets/password_field.dart';
import 'package:Botany/core/custom_widgets/text_field.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:Botany/presentation/start/mobile_start_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_navigator.dart';
import 'login_view_model.dart';
import 'package:provider/provider.dart';

class DesktopLoginView extends StatefulWidget {
  const DesktopLoginView({Key? key}) : super(key: key);

  static const String routeName = 'desktopLoginPage';

  @override
  State<DesktopLoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<DesktopLoginView, LoginViewModel>
    implements LoginNavigator {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  var keyForm = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool pass = true;

  /// as we define controllers as later we must initialized them
  @override
  void initState() {
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
          create: (c) => viewModel,
          child: Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                  ),
                  child: Image.asset(
                    "assets/images/wall.jpg",
                    fit: BoxFit.fill,
                    color: Colors.grey.withOpacity(0.7),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                Center(
                  child: Form(
                    key: keyForm,
                    child:  Container(
                        width: 550,
                        height: MediaQuery.of(context).size.height/1.3,
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 8.0),
                        /// main Container
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                            boxShadow: const [
                              BoxShadow(
                                color:Colors.grey,
                                blurRadius: 7.0, // soften the shadow
                                offset: Offset(
                                  1.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              ),
                            ],
                            color: Colors.white),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10.0, left: 5.0),
                          child: Column(
                            children: [
                              /// Login
                              Row(
                                children:const [
                                  Text(
                                    "Login ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              /// Email
                              Column(
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(30.0, 0, 0, 12.0),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomTextField(
                                    focusNode: emailFocusNode,
                                    controller: emailController,
                                    validatorFunction: (text) =>
                                        viewModel.emailValidation(text),
                                    preIcon: const Icon(Icons.email),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              /// password
                              Column(
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(30.0, 0, 0, 15.0),
                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  PasswordField(
                                    focusNode: passwordFocusNode,
                                  controller: passwordController,
                                  validatorFunction: (text) =>
                                      viewModel.passwordValidation(text),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 12,
                            ),

                            CustomButton(
                              width: 230,
                              height: 45,
                              color: MyColors.green,
                              title: 'Login',
                              radius: 25.0,
                              function: LoginButtonFunction,
                            ),
                          ],
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  LoginButtonFunction() async {
    if (keyForm.currentState!.validate() == true) {
      // please login
      viewModel.login(emailController.text, passwordController.text);
    }
  }

  @override
  void goToHome() async{
  MobileStartNavigator.pushScreenBasedOnEmail(emailController.text, context);

  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

}
