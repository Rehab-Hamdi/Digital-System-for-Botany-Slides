import 'package:flutter/material.dart';
import 'package:our_test_project/core/custom_widgets/drawer_list_tile.dart';

class MobileDrawerMenu extends StatelessWidget {
  MobileDrawerMenu({super.key, required this.name});
  final String name;

  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome  :  $name",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Dashboard Admin',
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                )
              ],
            ),
          ),
          DrawerListTile(
              title: 'Dashboard',
              icon: const Icon(Icons.dashboard, size: 20, color: Colors.black87),
              tap: () {

              }),
          DrawerListTile(
              title: 'Admin Reports',
              icon: const Icon(Icons.insert_chart,  size: 20, color: Colors.black),
              tap: () {
              }),
          DrawerListTile(
              title: 'Add User',
              icon: const Icon(Icons.person_add_alt_outlined, size: 20, color: Colors.black),
              tap: () {}),
          DrawerListTile(
              title: 'Update User', icon: const Icon(Icons.perm_identity_outlined, size: 20, color: Colors.black), tap: () {}),
          DrawerListTile(
              title: 'Delete User',
              icon: const Icon(Icons.person_off_outlined,  size: 20, color: Colors.black),
              tap: () {

              }),
          DrawerListTile(
              title: 'Calendar',
              icon: const Icon(Icons.calendar_month_rounded,  size: 20, color: Colors.black),
              tap: () {}),
          const Divider(),
          DrawerListTile(
              title: 'Logout',
              icon: const Icon(Icons.logout,  size: 20, color: Colors.black),
              tap: () {}),
        ],
      ),
    );
  }
}
