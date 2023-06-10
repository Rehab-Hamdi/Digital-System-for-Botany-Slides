import 'package:Botany/core/custom_widgets/simple_text_field.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/database_models/users.dart';
import 'package:Botany/presentation/dashboard_application_screens/users/users_view_model.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {

  String title;
  GlobalKey<FormState> formKey;
  String actionText;
  final Function()? actionFunction;
  UsersViewModel? viewModel;
  TextEditingController idController;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController? passwordController;
  TextEditingController phoneController;
  String? typeVal;
  TextEditingController ssnController;
  String? blockedState;

  CustomAlertDialog({super.key,
    required this.title,
    required this.formKey,
    required this.actionText,
    this.actionFunction,
    required this.viewModel,
    required this.idController,
    required this.nameController,
    required this.emailController,
    this.passwordController,
    required this.phoneController,
    this.typeVal,
    required this.ssnController,
    this.blockedState
});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  List<String> typeList = ['student', 'doctor', 'admin'];
  List<String> blockedList = ['Not Blocked', 'Blocked'];
  String dropDawnValueType = 'student';
  String dropDawnValueBlocked = 'Not Blocked';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        widget.title,
        style:
        Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleTextField(
                text: 'User Id',
                controller: widget.idController,
                validatorFunction: (text)=> widget.viewModel?.idValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Name',
                controller: widget.nameController,
                validatorFunction: (text)=> widget.viewModel?.userNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Email',
                controller: widget.emailController,
                validatorFunction: (text)=> widget.viewModel?.emailValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              if(widget.actionText != 'Update')
              SimpleTextField(
                text: 'User Password',
                controller: widget.passwordController! ,
                validatorFunction: (text)=> widget.viewModel?.passwordValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'User Phone',
                controller: widget.phoneController,
                validatorFunction: (text)=> widget.viewModel?.phoneValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'Social Security Number',
                controller: widget.ssnController,
                validatorFunction: (text)=> widget.viewModel?.ssnValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              if(widget.actionText == 'Update')
                ListTile(
                  title: const Text('Blocked State'),
                  trailing: DropdownButton(
                    items: blockedList
                        .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    value:  widget.blockedState ,
                    onChanged: (String? val) {
                      setState(() {
                        widget.blockedState = val!;
                      });
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              if(widget.actionText == 'Update')
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text('Select Type'),
                trailing: DropdownButton(
                  items: typeList
                      .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
                      .toList(),
                  value: widget.actionText == 'Update' ? widget.typeVal:dropDawnValueType,
                  onChanged: (String? val) {
                    setState(() {
                      widget.actionText == 'Update' ?
                      widget.typeVal = val!
                          :
                      dropDawnValueType = val!;
                    });
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
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
            onPressed: widget.actionText == 'Add' ? addNewUser
                : ( widget.actionText == 'Update' ? updateUser : widget.actionFunction),
            child: Text(
              widget.actionText,
              style: const TextStyle(fontSize: 18, color: MyColors.active),
            ),
          ),
        )
      ],
    );
  }

  void addNewUser() {
    if(widget.formKey.currentState!.validate()) {
      Users user = Users(
          id: int.parse(widget.idController.text),
          name: widget.nameController.text,
          email: widget.emailController.text,
          password: widget.passwordController!.text,
          phone: widget.phoneController.text,
          type: dropDawnValueType,
          ssn: widget.ssnController.text,
          blocked: 0
      );
      widget.viewModel!.createNewUser(user, context);
      clearControllers();
    }
  }

  void updateUser() {
    if(widget.formKey.currentState!.validate()) {
      Users user = Users(
        id: int.parse(widget.idController.text),
        name: widget.nameController.text,
        email: widget.emailController.text,
        phone: widget.phoneController.text,
        type: widget.typeVal,
        ssn: widget.ssnController.text,
        blocked: widget.blockedState == 'Blocked' ? 1 : 0,
      );
      widget.viewModel!.updateUserInfo(user, context);
      clearControllers();
    }
  }

  clearControllers() {
    widget.idController.clear();
    widget.nameController.clear();
    widget.emailController.clear();
    if(widget.actionText != 'Update') {
      widget.passwordController!.clear();
    }
    widget.phoneController.clear();
    widget.ssnController.clear();
  }
}
