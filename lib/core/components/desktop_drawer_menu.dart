import 'package:flutter/material.dart';
import 'package:our_test_project/core/custom_widgets/drawer_list_tile.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/add_user/desktop_add_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/desktop_delete_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/reports/reports_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/requests/desktop_request_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/update_user/desktop_update_user_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class DesktopDrawerMenu extends StatelessWidget {

  static const String routeName = 'DesktopDrawerMenu';
  const DesktopDrawerMenu({super.key});
  @override
  Widget build(BuildContext context) {

    return  Row(
        children: [
          Expanded(
            child: VerticalTabs(
              indicatorSide: IndicatorSide.start,
              tabsWidth: 220,
              indicatorColor: MyColors.active.withOpacity(0.7),
              selectedTabBackgroundColor: MyColors.active.withOpacity(0.1),
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: const [
                        SizedBox(height: 8,),
                        DrawerListTile(
                          title: 'Dashboard',
                          icon: Icon(Icons.dashboard, size: 20, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Add User',
                      icon: Icon(Icons.badge_outlined,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                        title: 'Update User',
                        icon: Icon(Icons.perm_identity_outlined,
                            size: 20, color: Colors.black)),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Delete User',
                      icon: Icon(Icons.person_off_outlined,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Register Slice',
                      icon: Icon(Icons.how_to_reg_outlined,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Admin Reports',
                      icon: Icon(Icons.insert_chart, size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Calendar',
                      icon: Icon(Icons.calendar_month_rounded,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Logout',
                      icon: Icon(Icons.logout, size: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
              contents: const [
                DesktopDashboardView(),
                DesktopAddNewUserView(),
                DesktopUpdateUserView(),
                DesktopDeleteUserView(),
                DesktopRequestsView(),
                ReportsView(),
                CalendarDashboardView(),
                Text('done'),
              ],
            ),
          ),
        ],
    );
  }
}
