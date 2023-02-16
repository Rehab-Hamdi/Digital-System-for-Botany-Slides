import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/colors.dart';
import 'package:our_test_project/core/custom_widgets/password_field.dart';
import 'package:our_test_project/core/custom_widgets/text_field.dart';
import 'package:our_test_project/presentation/auth/home/home_view.dart';
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
    return ChangeNotifierProvider(
        create: (c) => viewModel,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(
                child: Container(
                  width: 564,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.fill)),
                ),
              ),
              Form(
                key: keyForm,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.67,
                  /// main Container
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
                      color: Colors.white),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(37.0, 30.0, 0, 0),
                    child: Column(
                      children: [
                        /// Login
                        Row(
                          children:const [
                            Text(
                              "Login ",
                              style: TextStyle(
                                  fontSize: 28,
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
                              preIcon: Icon(Icons.email),
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
                          height: MediaQuery.of(context).size.height / 17,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50),
                          width: 180,
                          height: 50,
                          child: OutlinedButton(
                              onPressed: () {
                                LoginButtonFunction();
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(borderRadius:
                                  BorderRadius.circular(25)),
                                  side:const BorderSide(color: MyColors.lightBlack)
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
            ],
          ),
        ));
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
