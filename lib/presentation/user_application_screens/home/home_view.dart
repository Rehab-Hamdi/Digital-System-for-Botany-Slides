import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/user_application_screens/calendar/calendar_view.dart';
import 'package:Botany/presentation/user_application_screens/categories/categories_view.dart';
import 'package:Botany/presentation/user_application_screens/favorites/favorites_veiw.dart';
import 'package:Botany/presentation/user_application_screens/settings/settings_view.dart';
import 'package:Botany/utils/responsiveLayout.dart';

class HomeScreen extends StatefulWidget
{

  static const String routeName="HomeScreen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState()=>_HomeView();
}

class _HomeView extends State<HomeScreen> {

  List<Widget> pages = [
    ResponsiveLayout(mobileWidget: CategoryView()),
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
        height: MediaQuery.of(context).size.height*0.07,
        backgroundColor: MyColors.designGreen,
        buttonBackgroundColor: Colors.white,
        items:  [
          Icon(Icons.home, size: 28, color: MyColors.designGreen,),
          Icon(Icons.favorite, size: 28, color: Colors.red,),
          Icon(Icons.calendar_month_outlined, size: 28, color: MyColors.designGreen),
          Icon(Icons.settings, size: 28, color:MyColors.designGreen,),
        ],
      ),
    );
  }
}
