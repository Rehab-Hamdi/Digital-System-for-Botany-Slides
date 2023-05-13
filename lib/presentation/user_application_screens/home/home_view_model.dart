import 'dart:convert';

import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/database_models/Get_by_group.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_navigator.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  static const String BASE_URL = 'https://botany.larasci.site/api';

   Future<GetByGroup> getSlidesByGroupName(String group_name) async {
    //{{prod}}/api/slides?group_name=Phycology
    //var uri = Uri.https(BASE_URL,'/slides', {'group_name': group_name});
     var uri = Uri.parse('$BASE_URL/slides?group_name=$group_name');
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    GetByGroup slides = GetByGroup.fromJson(json);
    return slides;
  }
}
