import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/user_application_screens/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/user_application_screens/favorites/favorites_veiw.dart';
import 'package:our_test_project/presentation/user_application_screens/home/mobile_home_view.dart';
import 'package:our_test_project/presentation/user_application_screens/settings/seetings_view.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';

class HomeScreen extends StatefulWidget
{

  static const String routeName="HomeScreen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState()=>_HomeView();
}

class _HomeView extends State<HomeScreen> {

  List<Widget> pages = [
    ResponsiveLayout(mobileWidget: MobileHomeView()),
    const FavoriteView(),
    const CalendarView(),
    const SettingsView(),
  ];

  int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        height: 55,
        backgroundColor: MyColors.designGreen,
        buttonBackgroundColor: Colors.white,
        items:const  [
          Icon(Icons.home, size: 30, color: MyColors.designGreen,),
          Icon(Icons.favorite, size: 30, color: Colors.red,),
          Icon(Icons.calendar_month_outlined, size: 30, color: MyColors.designGreen),
          Icon(Icons.person, size: 30, color:MyColors.designGreen,),
        ],
      ),
    );
  }
}
