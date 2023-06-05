import 'package:flutter/material.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/desktop_titleAndInputField.dart';
import 'package:Botany/core/custom_widgets/page_title.dart';
import 'package:Botany/presentation/dashboard_application_screens/add_user/add_user_navigator.dart';
import 'package:Botany/presentation/dashboard_application_screens/add_user/add_user_view_model.dart';
import 'package:provider/provider.dart';

class   DesktopAddNewUserView extends StatefulWidget {
  static const String routeName = 'Desktop add new User';

  const DesktopAddNewUserView({super.key});

  @override
  State<DesktopAddNewUserView> createState() => _DesktopAddNewUserView();
}

class _DesktopAddNewUserView extends BaseState<DesktopAddNewUserView, AddUserViewModel> implements AddUserNavigator  {


  @override
  AddUserViewModel initViewModel() {
    return AddUserViewModel();
  }

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
  var keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    idController.addListener(() {
      setState(() {});
    });
    nameController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    phoneController.addListener(() {
      setState(() {});
    });
    typeController.addListener(() {
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
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        PageTitle(
                          title: 'Add New User Information',
                          wdth: 0.30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'ID  : ',
                    left_margin:72,
                    controller: idController,
                    focusNode: idFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Name  : ',
                    left_margin:40,
                    controller: nameController,
                    focusNode: nameFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Email  : ',
                    left_margin:44,
                    controller: emailController,
                    focusNode: emailFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Password  : ',
                    left_margin:8,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Phone  : ',
                    left_margin:36,
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  DesktopTitleAndInputField(
                    containerPadding: 60.0,
                    txt: 'Type : ',
                    left_margin:53,
                    controller: typeController,
                    focusNode: typeFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),

                  Expanded(
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: 220,
                          height: MediaQuery.of(context).size.height*0.07,
                          child: OutlinedButton(
                              onPressed: () {
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:Colors.green,
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(25)),
                              ),
                              child: const Text(
                                "ADD",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
