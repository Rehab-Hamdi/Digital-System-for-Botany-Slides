import 'package:flutter/material.dart';
import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/simple_text_field.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/users.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_navigator.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_view_model.dart';
import 'package:provider/provider.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);
  static const String routeName = "userView";

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends BaseState<UsersView, UsersViewModel>
    implements UserNavigator {
  late TextEditingController deleteUserController;
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController typeController;
  late TextEditingController ssnController;

  late TextEditingController updateIdController;
  late TextEditingController updateNameController;
  late TextEditingController updateEmailController;
  late TextEditingController updatePasswordController;
  late TextEditingController updatePhoneController;
  late TextEditingController updateTypeController;
  late TextEditingController updateSsnController;
  late TextEditingController updateBlockStateController;

  final GlobalKey<FormState> updateUserFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addNewUserFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> deleteUserFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    deleteUserController = TextEditingController();
    idController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    typeController = TextEditingController();
    ssnController = TextEditingController();

    updateIdController = TextEditingController();
    updateNameController = TextEditingController();
    updateEmailController = TextEditingController();
    updatePasswordController = TextEditingController();
    updatePhoneController = TextEditingController();
    updateTypeController = TextEditingController();
    updateSsnController = TextEditingController();
    updateBlockStateController = TextEditingController();

    super.initState();
  }
  
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
                child: TextButton(
                  onPressed: openAddNewUserDialog,
                  child: const Text('add new user +'),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder<List<Users>>(
                          future: APIManager.getAllUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString(), style: const TextStyle(color: Colors.red),),
                              );
                            }
                            if (snapshot.hasData) {
                              var data = snapshot.data;
                              var users = data;
                              return SizedBox(
                                //width: 950,
                                child: DataTable(
                                  headingRowColor: MaterialStateColor.resolveWith(
                                      (states) => MyColors.userInfoColor
                                          .withOpacity(0.1)),
                                  columns: [
                                    DataColumn(
                                        label: SizedBox(
                                      //width: MediaQuery.of(context).size.width *0.15,
                                      child: Text(
                                        'User ID',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    )),
                                    DataColumn(
                                        label: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.13,
                                      child: Text(
                                        'User Name',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    )),
                                    DataColumn(
                                        label: SizedBox(
                                     width: MediaQuery.of(context).size.width * 0.13,
                                      child: Text(
                                        'User Email',
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    )),
                                    const DataColumn(label: Text('')),
                                  ],
                                  rows: users
                                      !.map(
                                        (user) => DataRow(
                                          cells: [
                                            DataCell(
                                                user.blocked! ?
                                                Row(
                                                  children: [
                                                    Text('${user.id}',
                                                    style: const TextStyle(
                                                        color:
                                                        MyColors.userInfoColor)),
                                                    const SizedBox(width: 10,),
                                                    const Icon(Icons.block, color: Colors.red,),
                                              ],
                                            )
                                            :
                                              Text('${user.id}',
                                                style: const TextStyle(
                                                   color:
                                                   MyColors.userInfoColor)),
                                            ),
                                            DataCell(Text(user.name!,
                                                style: const TextStyle(
                                                    color:
                                                        MyColors.userInfoColor))),
                                            DataCell(Text(user.email!,
                                                style: const TextStyle(
                                                    color:
                                                        MyColors.userInfoColor))),
                                            DataCell(
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .visibility_outlined),
                                                    color: MyColors.userInfoColor,
                                                  ),
                                                  IconButton(
                                                    onPressed:(){
                                                      updateIdController.text = user.id.toString()!;
                                                      updateNameController.text = user.name!;
                                                      updateEmailController.text = user.email!;
                                                      updatePhoneController.text = user.phone!;
                                                      updateTypeController.text = user.type!;
                                                      updateSsnController.text = user.ssn!;
                                                      updateBlockStateController.text = user.blocked == null ? '0' : '1';
                                                      openUpdateUserDialog(user);
                                                      },
                                                    icon: const Icon(Icons.edit),
                                                    color: MyColors.userInfoColor,
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      await openDeleteUserDialog();
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    color: MyColors.userInfoColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).toList(),
                                ),
                              );
                            }
                            return const Center(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xff39A552),
                                    backgroundColor: Colors.transparent,
                            ),
                                ));
                          }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/plant1.png",
                  ),
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
  Future<String?> openDeleteUserDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Enter User Id',
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
            ),
            content: Form(
              key: deleteUserFormKey,
              child: SimpleTextField(
                text: 'Enter User Id',
                controller: deleteUserController,
                validatorFunction: (text)=> viewModel.idValidation(text),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
                child: TextButton(
                  onPressed: () {
                    clearAllControllars();
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
                  onPressed: deleteUser,
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontSize: 18, color: MyColors.active),
                  ),
                ),
              )
            ],
          ));

  @override
  Future openAddNewUserDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Add New User',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: addNewUserFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleTextField(
                    text: 'Enter Id',
                    controller: idController,
                    validatorFunction: (text)=> viewModel.idValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Name',
                    controller: nameController,
                    validatorFunction: (text)=> viewModel.userNameValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Email',
                    controller: emailController,
                    validatorFunction: (text)=> viewModel.emailValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Password',
                    controller: passwordController,
                    validatorFunction: (text)=> viewModel.passwordValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Phone',
                    controller: phoneController,
                    validatorFunction: (text)=> viewModel.phoneValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Type',
                    controller: typeController,
                    validatorFunction: (text)=> viewModel.userNameValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter SSN',
                    controller: ssnController,
                    validatorFunction: (text)=> viewModel.phoneValidation(text),
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
                  clearAllControllars();
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
                onPressed: addNewUser,
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 18, color: MyColors.active),
                ),
              ),
            )
          ],
        ),
      );

  @override
  Future openUpdateUserDialog(Users user) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Update User',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: updateUserFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleTextField(
                    text: 'User Id',
                    controller: updateIdController,
                    validatorFunction: (text)=> viewModel.idValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User Name',
                    controller: updateNameController,
                    validatorFunction: (text)=> viewModel.userNameValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User Email',
                    controller: updateEmailController,
                    validatorFunction: (text)=> viewModel.emailValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User Password',
                    controller: updatePasswordController,
                    validatorFunction: (text)=> viewModel.passwordValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User Phone',
                    controller: updatePhoneController,
                    validatorFunction: (text)=> viewModel.phoneValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User Type',
                    controller: updateTypeController,
                    validatorFunction: (text)=> viewModel.userNameValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'User SSN',
                    controller: updateSsnController,
                    validatorFunction: (text)=> viewModel.phoneValidation(text),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Blocked State (0 for unBlock or 1 for Block)',
                    controller: updateBlockStateController,
                    validatorFunction: (text)=> viewModel.blockedStatusValidation(text),
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
                  clearAllControllars();
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
                onPressed: updateUser,
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 18, color: MyColors.active),
                ),
              ),
            )
          ],
        ),
      );

  void deleteUser() {
    if(deleteUserFormKey.currentState!.validate()) {
      String? id = deleteUserController.text;
      viewModel.deleteUserById(id, context, deleteUserController);
    }
  }

  void updateUser() {
    if(updateUserFormKey.currentState!.validate()) {
      Users updatedUser = Users(
          id: int.parse(updateIdController.text),
          name: updateNameController.text,
          email: updateEmailController.text,
          password: updatePasswordController.text,
          phone: updatePhoneController.text,
          type: updateTypeController.text,
          ssn: updateSsnController.text,
          blocked: updateBlockStateController.text == '0' ? false : true,
      );
      viewModel.navigator!.showLoading();
      APIManager.updateUserRequest(updatedUser);
      Navigator.of(context).pop(updateUserFormKey.toString());
      viewModel.navigator!.hideLoading();
      viewModel.navigator!.showMessage("user updated successfully..!", true);
      clearAllControllars();
    }
  }

  void addNewUser() {
    if(addNewUserFormKey.currentState!.validate()) {
      Users newUser = Users(
        id: int.parse(idController.text),
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        type: typeController.text,
        ssn: ssnController.text,
        blocked: false
      );
      viewModel.navigator!.showLoading();
      APIManager.addNewUserRequest(newUser);
      Navigator.of(context).pop(addNewUserFormKey.toString());
      viewModel.navigator!.hideLoading();
      viewModel.navigator!.showMessage("user added successfully..!", true);
      clearAllControllars();
    }
  }

  void viewUser() {}

  clearAllControllars() { //
    deleteUserController.clear();
    idController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    typeController.clear();
    ssnController.clear();

    updateIdController.clear();
    updateNameController.clear();
    updateEmailController.clear();
    updatePasswordController.clear();
    updatePhoneController.clear();
    updateTypeController.clear();
    updateSsnController.clear();
    updateBlockStateController.clear();
  }

  @override
  void openDialog() {
    // TODO: implement openDialog
  }
}
