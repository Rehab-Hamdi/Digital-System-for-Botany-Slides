import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/my_themes.dart';
import 'package:our_test_project/firebase_options.dart';
import 'package:our_test_project/presentation/planet_info/provider/favorite_provider.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';
import 'package:our_test_project/presentation/calendar/calendar_view.dart';
import 'package:our_test_project/presentation/favorites/favorites_veiw.dart';
import 'package:our_test_project/presentation/home/home_view.dart';
import 'package:our_test_project/presentation/home/mobile_home_view.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_view.dart';
import 'package:our_test_project/presentation/settings/seetings_view.dart';
import 'package:our_test_project/presentation/start/start_view.dart';
import 'package:our_test_project/presentation/start/mobile_start_view.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyThemeData.themeData,
          routes: {
            LoginView.routeName: (c) => LoginView(),
            MobileLoginView.routeName: (c) => MobileLoginView(),
            DesktopLoginView.routeName: (c) => const DesktopLoginView(),
            MobileStartView.routeName: (c) => const MobileStartView(),
            StartView.routeName: (c) => const StartView(),
            HomeScreen.routeName: (c) => const HomeScreen(),
            MobileHomeView.routeName: (c) => MobileHomeView(),
            FavoriteView.routeName: (c) => FavoriteView(),
            SettingsView.routeName: (c) => SettingsView(),
            CalendarView.routeName: (c) => CalendarView(),
            PlanetInfoView.routeName: (c) => PlanetInfoView(),
          },
          initialRoute: HomeScreen.routeName),
    );
  }
}
