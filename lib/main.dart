import 'package:flutter/material.dart';
import 'package:our_test_project/core/components/desktop_drawer_menu.dart';
import 'package:our_test_project/core/styles/my_themes.dart';
import 'package:our_test_project/firebase_options.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/mobile_dashboard_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/desktop_delete_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/delete_user/mobile_delete_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/update_user/desktop_update_user_view.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/update_user/mobile_update_user_view.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_view.dart';
import 'package:our_test_project/presentation/planet_info/provider/favorite_provider.dart';
import 'package:our_test_project/presentation/start/start_view.dart';
import 'package:our_test_project/presentation/start/mobile_start_view.dart';
import 'package:our_test_project/presentation/user_application_screens/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/user_application_screens/categories/categories_view.dart';
import 'package:our_test_project/presentation/user_application_screens/favorites/favorites_veiw.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';
import 'package:our_test_project/presentation/user_application_screens/home/mobile_home_view.dart';
import 'package:our_test_project/presentation/user_application_screens/settings/settings_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

int? isLogin;
int? isLogout;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isLogin= sharedPreferences.getInt('login');
  //isLogout= sharedPreferences.getInt('logout');
  print('Login  = $isLogin');
  print('Logout  = $isLogout');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Sizer(builder: (context, orientation, deviceType)
   {

     return ChangeNotifierProvider(
       create: (context) => FavoriteProvider(),
       child: MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: MyThemeData.themeData,
           routes: {
             LoginView.routeName: (c) => LoginView(),
             MobileLoginView.routeName: (c) => MobileLoginView(),
             DesktopLoginView.routeName: (c) => DesktopLoginView(),
             MobileStartView.routeName: (c) => MobileStartView(),
             StartView.routeName: (c) => StartView(),
             HomeScreen.routeName: (c) => HomeScreen(),
             MobileHomeView.routeName: (c) => MobileHomeView(),
             FavoriteView.routeName: (c) => FavoriteView(),
             SettingsView.routeName: (c) => SettingsView(),
             CalendarView.routeName: (c) => CalendarView(),
             PlanetInfoView.routeName: (c) => PlanetInfoView(),
             CategoryView.routeName:(c)=> CategoryView(),
             DashBoardScreenController.routeName:(c)=>DashBoardScreenController(),
             DesktopDashboardView.routeName:(c)=>DesktopDashboardView(),
             MobileDashboardView.routeName:(c)=>MobileDashboardView(),
             DesktopDrawerMenu.routeName:(c)=>DesktopDrawerMenu(),
             DesktopDeleteUserView.routeName:(c)=> DesktopDeleteUserView(),
             MobileDeleteUserView.routeName:(c)=> MobileDeleteUserView(),
             DesktopUpdateUserView.routeName:(c)=> DesktopUpdateUserView(),
             MobileUpdateUserView.routeName:(c)=> MobileUpdateUserView(),
           },
           initialRoute: isLogin ==1 || isLogin == null?LoginView.routeName :StartView.routeName,
       ),

     );
   });
  }
}
