import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/my_themes.dart';
import 'package:our_test_project/firebase_options.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
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
  runApp(MyApp());
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
        LoginView.routeName:(c)=> LoginView(),
        MobileLoginView.routeName:(c)=>MobileLoginView(),
        DesktopLoginView.routeName: (c) => DesktopLoginView(),
        MobileStartView.routeName: (c)=>MobileStartView(),
        StartView.routeName: (c)=> StartView(),
        HomeScreen.routeName:(c)=> HomeScreen(),
        MobileHomeView.routeName:(c)=> MobileHomeView(),
        FavoriteView.routeName:(c)=> FavoriteView(),
        SettingsView.routeName:(c)=> SettingsView(),
        CalendarView.routeName:(c)=> CalendarView(),
      },
      initialRoute: StartView.routeName
    );
  }
}
