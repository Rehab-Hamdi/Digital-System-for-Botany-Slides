import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/user_model.dart';

class AllUsersTable extends StatelessWidget {
  Function()? openUpdateUserDialog;
  Function openDialog;

  AllUsersTable({super.key, required this.openUpdateUserDialog, required this.openDialog});
  List<User> users = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        headingRowColor: MaterialStateColor.resolveWith(
                (states) => MyColors.userInfoColor.withOpacity(0.1)),
        columns: [
          DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width*0.13,
                child: Text(
                  'ID',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
          DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width*0.13,
                child: Text(
                  'Name',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
          DataColumn(
              label: SizedBox(
                width: MediaQuery.of(context).size.width*0.13,
                child: Text(
                  'email',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
          DataColumn(label: Text('')),
        ],
        rows: users
            .map(
              (user) => DataRow(
            cells: [
              DataCell(Text('${user.id}',
                  style: const TextStyle(
                      color: MyColors.userInfoColor))),
              DataCell(Text(user.name,
                  style: const TextStyle(
                      color: MyColors.userInfoColor))),
              DataCell(Text(user.email,
                  style: const TextStyle(
                      color: MyColors.userInfoColor))),
              DataCell(
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_outlined),
                      color: MyColors.userInfoColor,),
                    IconButton(onPressed: openUpdateUserDialog, icon: const Icon(Icons.edit),
                      color: MyColors.userInfoColor,),
                    IconButton(onPressed: () async {
                      // get user id to be deleted
                      final id = await openDialog();
                    },
                      icon: const Icon(Icons.delete_outline),
                      color: MyColors.userInfoColor,),
                  ],
                ),
              ),
            ],
          ),
        )
            .toList(),
      ),
    );
  }
}
