import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/page_title.dart';
import 'package:our_test_project/core/custom_widgets/title_and_textField.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_navigator.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/delete_user_view_model.dart';
import 'package:provider/provider.dart';

class MobileUpdateUserView extends StatefulWidget {
  static const String routeName = 'Mobile Update User';

  const MobileUpdateUserView({super.key});

  @override
  State<MobileUpdateUserView> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends BaseState<MobileUpdateUserView, DeleteViewModel> implements DeleteNavigator {


  @override
  DeleteViewModel initViewModel() {
    return DeleteViewModel();
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
                  /*SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        PageTitle(
                          title: 'Update User Information',
                          wdth: 0.47,
                        ),
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'ID  : ',
                    left_margin:67,
                    controller: idController,
                    focusNode: idFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Name  : ',
                    left_margin:37,
                    controller: nameController,
                    focusNode: nameFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Password  : ',
                    left_margin:8,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
                    txt: 'Phone  : ',
                    left_margin:39,
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    // validatorFunction: (text) => viewModel.IdValidation(text), // TODO : there is something
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  MobileTitleAndInputField(
                    containerPadding: 16.0,
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
                          width: MediaQuery.of(context).size.width*0.45,
                          height: MediaQuery.of(context).size.height*0.06,
                          child: OutlinedButton(
                              onPressed: () {
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: MyColors.active,
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(25)),
                              ),
                              child: const Text(
                                "Update",
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
