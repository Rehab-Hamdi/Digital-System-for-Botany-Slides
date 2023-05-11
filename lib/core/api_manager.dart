import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:our_test_project/models/all_users.dart';

class APIManager{
  static const String BASE_URL ='https://botany.larasci.site/api'; //botany.larasci.site
  
  static Future<AllUsers> getAllUsers() async{
    Uri url = Uri.parse('$BASE_URL/users');
    http.Response response = await http.get(url);
    dynamic responseBody = jsonDecode(response.body);

    AllUsers allUsers = AllUsers.fromJson(responseBody);
    print(allUsers.fakeUsers);
    return allUsers;
  }
}