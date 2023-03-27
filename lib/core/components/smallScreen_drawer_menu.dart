import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/add_user/desktop_add_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/add_user/mobile_add_new_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/mobile_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/reports/reports_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/mobile_request_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/update_user/mobile_update_user_view.dart';
import 'package:our_test_project/presentation/user_application_screens/calendar/calendar_view.dart';

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
      container =  MobileDashboardView();
    } else if (currentPage == DrawerSections.reports) {
      container = const ReportsView();
    } else if (currentPage == DrawerSections.users) {
      container = const MobileAddNewUserView();
    } else if (currentPage == DrawerSections.requests) {
      container = const MobileRequestsView();
    } else if (currentPage == DrawerSections.calendar) {
      container = const CalendarView();
    }
    else if (currentPage == DrawerSections.logout) {
      container =  MobileAddNewUserView();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Botany',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      drawer: Drawer(
        child: MyDrawerList(),
      ),
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: ListView(
        // shows the list of menu drawer
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02
          ),
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Admin Reports", Icons.insert_chart,
              currentPage == DrawerSections.reports? true : false),
          menuItem(3, "Users", Icons.people_rounded,
              currentPage == DrawerSections.users ? true : false),
          menuItem(4, "Requests", Icons.receipt,
              currentPage == DrawerSections.requests? true : false),
          menuItem(5, "Calender", Icons.calendar_month_rounded,
              currentPage == DrawerSections.calendar? true : false),
          const Divider(),
          menuItem(8, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
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
              currentPage = DrawerSections.reports;
            } else if (id == 3) {
              currentPage = DrawerSections.users;
            } else if (id == 4) {
              currentPage = DrawerSections.requests;
            } else if (id == 5) {
              currentPage = DrawerSections.calendar;
            } else if (id == 6) {
              currentPage = DrawerSections.logout;
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
  logout,
}