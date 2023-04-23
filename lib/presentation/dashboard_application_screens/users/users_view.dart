import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/simple_text_field.dart';
import 'package:our_test_project/models/fake_users.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_navigator.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_view_model.dart';
import 'package:provider/provider.dart';

import 'modules/all_users_table.dart';

class UsersView extends StatefulWidget {
  List<FakeUsers> fakeUsers =[] ;
  UsersView({super.key});

  static const String routeName = "userView";

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends BaseState<UsersView, UsersViewModel>
    implements UserNavigator {

  late TextEditingController deleteUserController;
  late TextEditingController idController ;
  late TextEditingController nameController;
  late TextEditingController emailController ;
  late TextEditingController passwordController ;
  late TextEditingController phoneController ;
  late TextEditingController typeController ;
  final GlobalKey<FormState> updateUserFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addNewUserFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    deleteUserController = TextEditingController();
    idController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    typeController = TextEditingController();

    super.initState();
  }
  /*@override
  void dispose() {
    deleteUserController.dispose();
    idController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    typeController.dispose();

    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 15, right: 15),
                padding: const EdgeInsets.all(10),
                child: TextButton(onPressed: openAddNewUserDialog, child: const Text('add new user +'),),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: AllUsersTable(openUpdateUserDialog: openUpdateUserDialog, openDialog: openDialog,),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/plant1.png",),
                  Image.asset("assets/images/plant1.png")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UsersViewModel initViewModel() {
    return UsersViewModel();
  }

  @override
   Future<String?> openDialog() => showDialog<String>(
    context: context,
    builder: (context)=> AlertDialog(
      title: Text('Enter User Id' , style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),),
      content: SimpleTextField(text: 'Enter User Id', controller: deleteUserController, ),
      actions: [
        TextButton(
          onPressed: updateUser,
          child: const Text('DELETE', style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    )
  );

  Future openAddNewUserDialog()=>showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add New User' , style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),),
      content: SingleChildScrollView(
        child: Form(
          key: addNewUserFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleTextField(text: 'Enter Id', controller: idController,),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Name', controller: nameController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Email', controller: emailController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Password', controller: passwordController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Phone', controller: phoneController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Type', controller: typeController, ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: addNewUser,
          child: const Text('ADD', style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );

  Future openUpdateUserDialog()=>showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Update User' , style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),),
      content: SingleChildScrollView(
        child: Form(
          key: updateUserFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleTextField(text: 'Enter Id', controller: idController,),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Name', controller: nameController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Email', controller: emailController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Password', controller: passwordController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Phone', controller: phoneController, ),
              const SizedBox(height: 10,),
              SimpleTextField(text: 'Enter Type', controller: typeController, ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: deleteUser,
          child: const Text('UPDATE', style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );

  void deleteUser(){
    Navigator.of(context).pop(deleteUserController.text);
  }
  void updateUser(){
    Navigator.of(context).pop(updateUserFormKey.toString());
  }
  void addNewUser(){
    Navigator.of(context).pop(addNewUserFormKey.toString());
  }
  void viewUser(){}
}
