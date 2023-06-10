import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/base.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/database_models/users.dart';
import 'package:Botany/presentation/dashboard_application_screens/users/users_navigator.dart';
import 'package:Botany/presentation/dashboard_application_screens/users/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/custom_alert_dialog.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);
  static const String routeName = "userView";

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends BaseState<UsersView, UsersViewModel>
    implements UserNavigator {
  List<Users>? _users;
  List<Users> _filteredUsers = [];
  String _searchQuery = ''; //
  Widget _buildSearchBar() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*0.12,
          right: MediaQuery.of(context).size.width*0.13,
          bottom:MediaQuery.of(context).size.height*.02,
        ),
        child: TextField(
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
              _filteredUsers = _users!
                  .where((user) =>
              user.name!.toLowerCase().contains(_searchQuery.toLowerCase())
                  ||
                  user.id.toString().toLowerCase().contains(_searchQuery.toLowerCase())).toList();
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search by name or ssn or ID',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: MyColors.lightGray,),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: MyColors.lightGray,),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  late TextEditingController deleteUserController;
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController ssnController;
  late String typeVal;

  late TextEditingController updateIdController;
  late TextEditingController updateNameController;
  late TextEditingController updateEmailController;
  late TextEditingController updatePasswordController;
  late TextEditingController updatePhoneController;
  late TextEditingController updateSsnController;
  late String updateTypeVal;
  late String blockedState;

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
    ssnController = TextEditingController();

    updateIdController = TextEditingController();
    updateNameController = TextEditingController();
    updateEmailController = TextEditingController();
    updatePasswordController = TextEditingController();
    updatePhoneController = TextEditingController();
    updateSsnController = TextEditingController();

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
                child: Row(
                  children: [
                    _buildSearchBar(),
                    TextButton(
                      onPressed: openAddNewUserDialog,
                      child: const Text('add new user +', style: TextStyle(fontSize: 17),),
                    ),
                  ],
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
                              _users = snapshot.data;
                              List<Users> usersToDisplay =
                              _searchQuery.isEmpty ? _users! : _filteredUsers;
                              return Column(
                                children: [
                                  DataTable(
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
                                    rows: usersToDisplay
                                        .map(
                                          (user) => DataRow(
                                            cells: [
                                              DataCell(
                                                  user.blocked == 1 ?
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
                                                      onPressed:(){
                                                        viewUser(user);
                                                      },
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
                                                        updateTypeVal = user.type!;
                                                        updateSsnController.text = user.ssn!;
                                                        blockedState = user.blocked == null || user.blocked == 0 ? 'Not Blocked' : 'Blocked';
                                                        openUpdateUserDialog(user);
                                                        },
                                                      icon: const Icon(Icons.edit),
                                                      color: MyColors.userInfoColor,
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        int userId = user.id!;
                                                        String userName = user.name!;
                                                        await openDeleteUserDialog(userId, userName);
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
                                ],
                              );
                            }
                            return const Center(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xff39A552),
                            ),
                                ));
                          }),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Image.asset(
                      "assets/images/plant1.png",
                    ),
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
  Future<String?> openDeleteUserDialog(int userId, String userName) => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Are you sure want to delete?',
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16, color: Colors.red),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: const Text('User ID'),
                  leading: const Icon(Icons.assignment_ind),
                  subtitle: Text(userId.toString()),
                ),
                ListTile(
                  title: const Text('User Name'),
                  leading: const Icon(Icons.person),
                  subtitle: Text(userName),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
                child: TextButton(
                  onPressed: () {
                    clearAllControllers();
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
                  onPressed: (){viewModel.deleteUserById(userId.toString(), context);},
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
        builder: (context) => CustomAlertDialog(
            title: 'Add New User',
            formKey: addNewUserFormKey,
            actionText: 'Add',
            viewModel: viewModel,
            idController: idController,
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
            phoneController: phoneController,
            ssnController: ssnController),
      );


  @override
  Future openUpdateUserDialog(Users user) => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
            title: 'Update User Information',
            formKey: updateUserFormKey,
            actionText: 'Update',
            viewModel: viewModel,
            idController: updateIdController,
            nameController: updateNameController,
            emailController: updateEmailController,
            phoneController: updatePhoneController,
            ssnController: updateSsnController,
            typeVal: updateTypeVal,
            blockedState: blockedState,
        ),
      );

  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
      color: MyColors.active
  );
  TextStyle subtitleStyle = const TextStyle(
    color: MyColors.userInfoColor,
  );
  Future viewUser(Users user) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: true,
      title: Center(
        child: Text(
          user.name!.toUpperCase(),
          style:
          Theme.of(context).textTheme.headline6!,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Social Security Number:', style: textStyle,),
            leading: const Icon(Icons.security, color: MyColors.active),
            subtitle: Text(user.ssn!, style: subtitleStyle,),
          ),
          ListTile(
            title: Text('ID:', style: textStyle,),
            leading: const Icon(Icons.assignment_ind, color: MyColors.active),
            subtitle: Text(user.id.toString(), style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Name:', style: textStyle,),
            leading: const Icon(Icons.person, color: MyColors.active),
            subtitle: Text(user.name!, style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Email:', style: textStyle,),
            leading: const Icon(Icons.email, color: MyColors.active),
            subtitle: Text(user.email!, style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Phone:', style: textStyle,),
            leading: const Icon(Icons.phone, color: MyColors.active),
            subtitle: Text(user.phone!, style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Type:', style: textStyle,),
            leading: const Icon(Icons.groups, color: MyColors.active),
            subtitle: Text(user.type!, style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Blocked Status:', style: textStyle,),
            leading: Icon(Icons.block,
              color: user.blocked == 1 ? Colors.red : MyColors.active,
            ),
            subtitle: Text(
              user.blocked == 1 ? 'blocked' : 'not blocked',
              style: subtitleStyle,),
          ),
          ListTile(
            title: Text('Account Created Date:', style: textStyle,),
            leading: const Icon(Icons.date_range, color: MyColors.active),
             subtitle: Text(formattedDate(user.createdAt!)!, style: subtitleStyle,),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:
            const Text(
              'Cancel',
              style: TextStyle(
                color: MyColors.active,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  String? formattedDate(String date){
    DateTime dateTime= DateTime.parse(date);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} at ${dateTime.hour}:${dateTime.minute}';
  }
  clearAllControllers() { //
    idController.clear();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    ssnController.clear();

    updateIdController.clear();
    updateNameController.clear();
    updateEmailController.clear();
    updatePasswordController.clear();
    updatePhoneController.clear();
    updateSsnController.clear();
  }
}
