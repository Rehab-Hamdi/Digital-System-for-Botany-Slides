import 'package:flutter/material.dart';
import 'package:Botany/core/custom_widgets/drawer_list_tile.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/dashboard_application_screens/calendar/calendar_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/reports/reports_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/requests/request_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/settings/desktop_settings.dart';
import 'package:Botany/presentation/dashboard_application_screens/users/users_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class DesktopDrawerMenu extends StatelessWidget {

  static const String routeName = 'DesktopDrawerMenu';
  const DesktopDrawerMenu({super.key});
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icons/botany_icon2.png',),
        ),
        actions: [
          Center(child: Text('Alsafa', style: Theme.of(context).textTheme.headline5,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person), color: Colors.grey,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: VerticalTabs(
              indicatorWidth: 7,
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
                      title: 'Users',
                      icon: Icon(Icons.badge_outlined,
                          size: 20, color: Colors.black),
                    ),
                  ),
                ),
                const Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: DrawerListTile(
                      title: 'Requests',
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
                      title: 'Settings',
                      icon: Icon(Icons.settings, size: 20, color: Colors.black),
                    ),
                  ),
                ),
              ],
              contents: const [
                DesktopDashboardView(),
                UsersView(),
                RequestsView(),
                ReportsView(),
                CalendarDashboardView(),
                DesktopSettingsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
