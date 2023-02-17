import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/password_field.dart';
import 'package:our_test_project/core/custom_widgets/text_field.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/home/home_view.dart';
import 'login_navigator.dart';
import 'login_view_model.dart';
import 'package:provider/provider.dart';

class MobileLoginView extends StatefulWidget {
  const MobileLoginView({Key? key}) : super(key: key);

  static const String routeName = 'mobileLoginPage';

  @override
  State<MobileLoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<MobileLoginView, LoginViewModel>
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
                    'assets/images/mobileLoginWall.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                        key: keyForm,
                        child:  Container(
                          margin: const EdgeInsets.only( left: 20.0, bottom: 100.0),
                          color: Colors.transparent,
                          /// main Container
                          child: Container(
                            margin: const EdgeInsets.only( left: 5.0),
                            child: Column(
                              children: [
                                /// Login
                                Row(
                                  children:const [
                                    Text(
                                      "Login ",
                                      style: TextStyle(
                                          fontSize: 35,
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
                                          EdgeInsets.fromLTRB(20.0, 0, 0, 12.0),
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 20, color: MyColors.darkGray),
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
                                          EdgeInsets.fromLTRB(20.0, 0, 0, 15.0),
                                          child: Text(
                                            "Password",
                                            style: TextStyle(
                                                fontSize: 20, color: MyColors.darkGray),
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

                                Container(
                                  margin: EdgeInsets.only(right: 25),
                                  width: 230,
                                  height: 50,
                                  child: OutlinedButton(
                                      onPressed: () {
                                        LoginButtonFunction();
                                      },
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: MyColors.lightGreen,
                                          shape: RoundedRectangleBorder(borderRadius:
                                          BorderRadius.circular(25)),
                                          side: const BorderSide(color: MyColors.lightBlack)
                                      ),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ],
                            ),
                          ),
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
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeView.routeName);
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

}
