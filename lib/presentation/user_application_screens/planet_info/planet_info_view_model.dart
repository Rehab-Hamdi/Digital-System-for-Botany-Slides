import 'package:our_test_project/core/api_manager.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/presentation/user_application_screens/planet_info/planet_info_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanetInfoViewModel extends BaseViewModel<PlanetInfoNavigator> {
  Future<void> makeRequest(int? slideId) async{
    //get current user id from SharedPreferences
    SharedPreferences prefs= await SharedPreferences.getInstance();
    int? userId= prefs.getInt('user_id');

    APIManager.makeNewRequest(slideId: slideId, userId: userId,);
  }
}