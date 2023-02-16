import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/my_themes.dart';
import 'package:our_test_project/firebase_options.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/presentation/home/home_view.dart';
import 'package:our_test_project/presentation/home/mobile_home_view.dart';

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
        MobileHomeView.routeName: (c)=>MobileHomeView(),
        HomeView.routeName: (c)=> HomeView(),
      },
      initialRoute: HomeView.routeName
    );
  }
}
