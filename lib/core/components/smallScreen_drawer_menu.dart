import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/add_user/mobile_add_new_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/mobile_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/reports/reports_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/desktop_request_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/users/users_view.dart';
import 'package:our_test_project/presentation/user_application_screens/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/user_application_screens/settings/settings_view.dart';

class MobileDrawerMenu extends StatefulWidget {

  static const String routeName = 'MobileDrawerMenu';

  MobileDrawerMenu({super.key});

  @override
  State<MobileDrawerMenu> createState() => _MobileDrawerMenuState();
}

class _MobileDrawerMenuState extends State<MobileDrawerMenu> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container =  DesktopDashboardView();
    } else if (currentPage == DrawerSections.reports) {
      container = const ReportsView();
    } else if (currentPage == DrawerSections.users) {
      container = UsersView();
    } else if (currentPage == DrawerSections.requests) {
      container = const RequestsView();
    } else if (currentPage == DrawerSections.calendar) {
      container = const CalendarView();
    }
    else if (currentPage == DrawerSections.settings) {
      container =  SettingsView();
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, // change the color here
        ),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/botany_icon2.png',
          ),
        ),
        actions: [
          Center(
              child: Text(
                'Alsafa',
                style: Theme.of(context).textTheme.headline5,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            color: Colors.grey,
          ),
        ],
      ),
      drawer: Drawer(
        child: MyDrawerList(),
      ),
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: ListView(
        // shows the list of menu drawer
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02
          ),
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Users",Icons.badge_outlined,
              currentPage == DrawerSections.users? true : false),
          menuItem(3, "Register Slice", Icons.how_to_reg_outlined ,
              currentPage == DrawerSections.requests ? true : false),
          menuItem(4, "Admin Reports", Icons.insert_chart,
              currentPage == DrawerSections.reports? true : false),
          menuItem(5, "Calender",Icons.calendar_month_rounded,
              currentPage == DrawerSections.calendar? true : false),
          menuItem(6, "settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? MyColors.active.withOpacity(0.2): Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.users;
            } else if (id == 3) {
              currentPage = DrawerSections.requests;
            } else if (id == 4) {
              currentPage = DrawerSections.reports;
            } else if (id == 5) {
              currentPage = DrawerSections.calendar;
            } else if (id == 6) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  reports,
  users,
  requests,
  calendar,
  settings,
}