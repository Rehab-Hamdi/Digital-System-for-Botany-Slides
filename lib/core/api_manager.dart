import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:our_test_project/models/users.dart';

class APIManager{
  static const String BASE_URL ='https://botany.larasci.site/api';
  
  static Future<List<Users>> getAllUsers() async{
    List<Users> allUsers;
    Uri url = Uri.parse('$BASE_URL/users');
    http.Response response = await http.get(url);
    allUsers = (json.decode(response.body) as List).map((i) => Users.fromJson(i)).toList();
    return allUsers;
  }

  // create new user
  static Future<http.Response>addNewUserRequest(Users user)async{
    Uri url = Uri.parse('$BASE_URL/users');
    http.Response response = await http.post(url, body:user.toJson());
    if(response.statusCode == 201)
      {
        print('user added successfully!');
      }
    else{
      print(response.statusCode);
      print('\n${response.body}');
    }
    return response;
  }

  // delete user
  static Future<http.Response>deleteUserRequest(String id)async{
    Uri url = Uri.parse('$BASE_URL/users/$id');
    http.Response response = await http.delete(url);
    if(response.statusCode == 201)
    {
      print('user deleted successfully!');
    }
    else{
      print(response.statusCode);
      print('\n${response.body}');
    }
    return response;
  }

  // update exist user
  static Future<http.Response>updateUserRequest(Users user)async{
    Uri url = Uri.parse('$BASE_URL/users/${user.id}'); //'https://botany.larasci.site/api/users/${user.id}'
    print(url);
    http.Response response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:jsonEncode({
          "name" : user.name,
          "password" : user.password,
          "email": user.email,
          "phone": user.phone,
          "type" : user.type,
          "ssn" : user.ssn,
          "blocked": user.blocked,
    }));

    if(response.statusCode == 203)
    {
      print('user updated successfully...!');
    }
    else{
      print(response.statusCode);
      print('\n${response.body}');
    }
    print (response.body);
    return response;
  }
}