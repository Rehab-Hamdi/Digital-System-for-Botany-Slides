import 'package:flutter/material.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/desktop_titleAndInputField.dart';
import 'package:Botany/core/custom_widgets/page_title.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/dashboard_application_screens/update_user/update_user_navigator.dart';
import 'package:Botany/presentation/dashboard_application_screens/update_user/update_user_view_model.dart';
import 'package:provider/provider.dart';

class DesktopUpdateUserView extends StatefulWidget {
  static const String routeName = 'Desktop Update User';

  const DesktopUpdateUserView({super.key});

  @override
  State<DesktopUpdateUserView> createState() => _DesktopUpdateUserView();
}

class _DesktopUpdateUserView
    extends BaseState<DesktopUpdateUserView, UpdateUserViewModel>
    implements UpdateUserNavigator {
  @override
  UpdateUserViewModel initViewModel() {
    return UpdateUserViewModel();
  }

  var keyForm = GlobalKey<FormState>();
  FocusNode idFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode typeFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    idFocusNode.addListener(() {
      setState(() {});
    });
    nameFocusNode.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    typeFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (c) => viewModel,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        PageTitle(
                          title: 'Update User Information',
                          wdth: 0.30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ///Id
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'ID  : ',
                    left_margin: 72,
                    controller: idController,
                    focusNode: idFocusNode,
                    validatorFunction: (text) => viewModel.IDValidation(text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ///Name
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Name  : ',
                    left_margin: 40,
                    controller: nameController,
                    focusNode: nameFocusNode,
                     validatorFunction: (text) => viewModel.nameValidation(text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  /// Email
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Email  : ',
                    left_margin: 44,
                    controller: emailController,
                    focusNode: emailFocusNode,
                    validatorFunction: (text) =>
                        viewModel.emailValidation(text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ///Password
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Password  : ',
                    left_margin: 8,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    validatorFunction: (text) => viewModel.passwordValidation(text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ///Phone
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Phone  : ',
                    left_margin: 36,
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    validatorFunction: (text) => viewModel.phoneValidation(text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ///Type
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Type : ',
                    left_margin: 53,
                    controller: typeController,
                    focusNode: typeFocusNode,
                    validatorFunction: (text) => viewModel.typeValidation(text), // TODO : there is something
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/plant1.png",),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            width: 220,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: OutlinedButton(
                                onPressed: () {
                                  UpdateButtonFunction();
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: BorderSide(color: MyColors.active),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                child: const Text(
                                  "Update",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: MyColors.active),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          Image.asset("assets/images/plant1.png")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  UpdateButtonFunction() async {
    if (keyForm.currentState!.validate() == true) {
      // AlertDialog(
      //   content: Text(
      //     'Done',
      //     style: TextStyle(color: Colors.red.shade400, fontSize: 17),
      //   ),
      //   actions: [
      //     Center(
      //         child: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       icon: const Icon(
      //         Icons.cancel,
      //         color: MyColors.designGreen,
      //       ),
      //     ))
      //   ],
      // );
      print('All is Done');
    }
  }
}
