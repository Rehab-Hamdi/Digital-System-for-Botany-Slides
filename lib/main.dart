import 'package:Botany/presentation/auth/login/desktop_login_view.dart';
import 'package:Botany/presentation/auth/login/login_view.dart';
import 'package:Botany/presentation/auth/login/mobile_login_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/add_user/desktop_add_user_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/add_user/mobile_add_new_user_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_controller/main_dashboard_controller.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/desktop_dashboard_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/desktop_edit_request_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/edit_request/mobile_edit_request_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/requests/request_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/update_user/desktop_update_user_view.dart';
import 'package:Botany/presentation/dashboard_application_screens/update_user/mobile_update_user_view.dart';
import 'package:Botany/presentation/start/mobile_start_view.dart';
import 'package:Botany/presentation/start/start_view.dart';
import 'package:Botany/presentation/user_application_screens/calendar/calendar_view.dart';
import 'package:Botany/presentation/user_application_screens/categories/categories_view.dart';
import 'package:Botany/presentation/user_application_screens/favorites/favorites_veiw.dart';
import 'package:Botany/presentation/user_application_screens/home/home_view.dart';
import 'package:Botany/presentation/user_application_screens/home/mobile_home_view.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/planet_info_view.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/provider/favorite_provider.dart';
import 'package:Botany/presentation/user_application_screens/settings/settings_view.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'checkNetwork/check_network.dart';
import 'core/components/desktop_drawer_menu.dart';
import 'core/components/smallScreen_drawer_menu.dart';
import 'core/styles/my_themes.dart';
import 'firebase_options.dart';

bool check = false;
bool isNotConnected = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  WidgetsFlutterBinding.ensureInitialized();

  FirebaseAuth auth = FirebaseAuth.instance;

  // Check if user is already logged in
  if (auth.currentUser != null) {
    print('User is logged in');
    check = true;
  } else {
    print('User is not logged in');
    check = false;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkNetworkConnectivity(); // Check initial network connectivity
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isNotConnected = (result == ConnectivityResult.none);
      });
    });
  }

  Future<void> checkNetworkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isNotConnected = (connectivityResult == ConnectivityResult.none);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isNotConnected) {
      return NoNetworkApp();
    } else {
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
              HomeView.routeName: (c) => HomeView(),
              FavoriteView.routeName: (c) => FavoriteView(),
              SettingsView.routeName: (c) => SettingsView(),
              CalendarView.routeName: (c) => CalendarView(),
              PlanetInfoView.routeName: (c) => PlanetInfoView(),
              CategoryView.routeName: (c) => CategoryView(),
              DashBoardScreenController.routeName: (c) =>
                  const DashBoardScreenController(),
              DesktopDrawerMenu.routeName: (c) => DesktopDrawerMenu(),
              MobileDrawerMenu.routeName: (c) => MobileDrawerMenu(),
              DesktopDashboardView.routeName: (c) => DesktopDashboardView(),
              DesktopAddNewUserView.routeName: (c) => DesktopAddNewUserView(),
              MobileAddNewUserView.routeName: (c) => MobileAddNewUserView(),
              DesktopUpdateUserView.routeName: (c) => DesktopUpdateUserView(),
              MobileUpdateUserView.routeName: (c) => MobileUpdateUserView(),
              RequestsView.routeName: (c) => RequestsView(),
              DesktopEditRequestView.routeName: (c) => DesktopEditRequestView(),
              MobileEditRequestView.routeName: (c) => MobileEditRequestView(),
            },
            initialRoute: check ? StartView.routeName : LoginView.routeName,
          ),
        );
    }
  }
}
