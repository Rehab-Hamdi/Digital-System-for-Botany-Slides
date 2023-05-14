import 'package:flutter/material.dart';
import 'package:our_test_project/core/custom_widgets/simple_text_field.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_view_model.dart';

class CustomAlertDialog extends StatelessWidget {
  String title;
  GlobalKey<FormState> formKey;
  String actionText;
  final Function() actionFunction;
  UsersViewModel? viewModel;
  TextEditingController idController;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;
  TextEditingController typeController;
  TextEditingController ssnController;
  TextEditingController? blockedController;

  CustomAlertDialog({super.key,
    required this.title,
    required this.formKey,
    required this.actionText,
    required this.actionFunction,
    required this.viewModel,
    required this.idController,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.typeController,
    required this.ssnController,
    this.blockedController
});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        title,
        style:
        Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleTextField(
                text: 'User Id',
                controller: idController,
                validatorFunction: (text)=> viewModel?.idValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Name',
                controller: nameController,
                validatorFunction: (text)=> viewModel?.userNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Email',
                controller: emailController,
                validatorFunction: (text)=> viewModel?.emailValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Password',
                controller: passwordController,
                validatorFunction: (text)=> viewModel?.passwordValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Phone',
                controller: phoneController,
                validatorFunction: (text)=> viewModel?.phoneValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Type',
                controller: typeController,
                validatorFunction: (text)=> viewModel?.userNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'Social Security Number',
                controller: ssnController,
                validatorFunction: (text)=> viewModel?.phoneValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              if(actionText == 'Update')
              SimpleTextField(
                text: 'Blocked Status(0 for unBlock and 1 for Block)',
                controller: blockedController!,
                validatorFunction: (text)=> viewModel?.blockedStatusValidation(text),
              ),
              if(actionText == 'Update')
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: () {
              clearControllers();
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: actionFunction,
            child: Text(
              actionText,
              style: const TextStyle(fontSize: 18, color: MyColors.active),
            ),
          ),
        )
      ],
    );
  }
  clearControllers() {
    idController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    typeController.clear();
    ssnController.clear();
  }
}
