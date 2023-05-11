import 'package:flutter/material.dart';
import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/simple_text_field.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/all_users.dart';
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
  /*List<User> users = [
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
    User(id: 123456789, name: 'Rehab', email: 'rehab@gmail.com'),
    User(id: 123456789, name: 'Mahmoud', email: 'mahmoud@gmail.com'),
    User(id: 123456789, name: 'Hagar', email: 'hagar@gmail.com'),
    User(id: 123456789, name: 'Rahma', email: 'rahma@gmail.com'),
  ];*/

  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController typeController;
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
    APIManager.getAllUsers();
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
                      child: FutureBuilder<AllUsers>(
                          future: APIManager.getAllUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            if (snapshot.hasData) {
                              var data = snapshot.data;
                              var users = data?.fakeUsers;
                              return DataTable(
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => MyColors.userInfoColor
                                        .withOpacity(0.1)),
                                columns: [
                                  DataColumn(
                                      label: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    child: Text(
                                      'ID',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  )),
                                  DataColumn(
                                      label: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    child: Text(
                                      'Name',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  )),
                                  DataColumn(
                                      label: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.13,
                                    child: Text(
                                      'email',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  )),
                                  DataColumn(label: Text('')),
                                ],
                                rows: users
                                    !.map(
                                      (user) => DataRow(
                                        cells: [
                                          DataCell(Text('${user.id}',
                                              style: const TextStyle(
                                                  color:
                                                      MyColors.userInfoColor))),
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
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .visibility_outlined),
                                                  color: MyColors.userInfoColor,
                                                ),
                                                IconButton(
                                                  onPressed:
                                                      openUpdateUserDialog,
                                                  icon: const Icon(Icons.edit),
                                                  color: MyColors.userInfoColor,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    // get user id to be deleted
                                                    final id =
                                                        await openDialog();
                                                  },
                                                  icon: const Icon(
                                                      Icons.delete_outline),
                                                  color: MyColors.userInfoColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).toList(),
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Color(0xff39A552),
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
  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Enter User Id',
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
            ),
            content: SimpleTextField(
              text: 'Enter User Id',
              controller: deleteUserController,
            ),
            actions: [
              TextButton(
                onPressed: updateUser,
                child: const Text('DELETE',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ));

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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Name',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Phone',
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Type',
                    controller: typeController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: addNewUser,
              child: const Text(
                'ADD',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  Future openUpdateUserDialog() => showDialog(
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
                    text: 'Enter Id',
                    controller: idController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Name',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Phone',
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleTextField(
                    text: 'Enter Type',
                    controller: typeController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: deleteUser,
              child: const Text(
                'UPDATE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  void deleteUser() {
    Navigator.of(context).pop(deleteUserController.text);
  }

  void updateUser() {
    Navigator.of(context).pop(updateUserFormKey.toString());
  }

  void addNewUser() {
    Navigator.of(context).pop(addNewUserFormKey.toString());
  }

  void viewUser() {}
}
