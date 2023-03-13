import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/my_themes.dart';
import 'package:our_test_project/firebase_options.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/presentation/dashboard_application/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/start/start_view.dart';
import 'package:our_test_project/presentation/start/mobile_start_view.dart';
import 'package:our_test_project/presentation/user_application/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/user_application/home/mobile_home_view.dart';
import 'package:our_test_project/presentation/user_application/settings/seetings_view.dart';

import 'presentation/user_application/favorites/favorites_veiw.dart';
import 'presentation/user_application/home/home_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.themeData,
      routes: {
        LoginView.routeName:(c)=> const LoginView(),
        MobileLoginView.routeName:(c)=>const MobileLoginView(),
        DesktopLoginView.routeName: (c) => const DesktopLoginView(),
        MobileStartView.routeName: (c)=>const MobileStartView(),
        StartView.routeName: (c)=> const StartView(),
        HomeScreen.routeName:(c)=> const HomeScreen(),
        MobileHomeView.routeName:(c)=> MobileHomeView(),
        FavoriteView.routeName:(c)=> const FavoriteView(),
        SettingsView.routeName:(c)=> const SettingsView(),
        CalendarView.routeName:(c)=> const CalendarView(),
        CalendarDashboardView.routeName:(c)=> const CalendarDashboardView(),

      },
      initialRoute: StartView.routeName
    );
  }
}
