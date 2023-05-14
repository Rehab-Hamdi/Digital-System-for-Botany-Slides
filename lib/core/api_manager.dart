import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:our_test_project/database_models/requests/GetAllRequests.dart';
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

  static Future<Users> getUserById(String? id) async{
    Uri url = Uri.parse('$BASE_URL/users/$id');
    http.Response response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    Users user = Users.fromJson(responseBody);
    return user;
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

  static Future<GetAllRequests> getAllRequestsInfo()async{
    Uri url= Uri.parse('$BASE_URL/requests');
    http.Response response= await http.get(url);
    var json= jsonDecode(response.body);
    GetAllRequests requests = GetAllRequests.fromJson(json);
    return requests;
  }

  static putApproveRequest(user_id, slide_id) async {
    // var url = Uri.parse('$BASE_URL/accept_request');
    Uri url = Uri.parse('$BASE_URL/accept_request');
    var body = {
      'user_id': '${user_id}',
      'slide_id': '${slide_id}',
    };
    try {
      http.Response response = await http.put(
          url,
          //headers: {'Content-Type': 'application/json'},
          body:body
      );
      if (response.statusCode == 200) {
        // Successful PUT request
        print('PUT approve request successful!');
        print('Response body: ${response.body}');
      } else {
        // Handle error response
        print(
            'PUT approve request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle request failure
      print('Error making PUT approve request: $error');
    }
  }

  static putRejectRequest(user_id,slide_id) async {
    Uri url = Uri.parse('$BASE_URL/reject_request');
    var body = {
      'user_id': '${user_id}',
      'slide_id': '${slide_id}',
    };

    try {
      http.Response response = await http.put(url, body: body);

      if (response.statusCode == 200) {
        // Successful PUT request
        print('PUT reject request successful!');
        print('Response body: ${response.body}');
      } else {
        // Handle error response
        print(
            'PUT reject request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle request failure
      print('Error making PUT reject request: $error');
    }
  }

  static putUpdateRequest(user_id, slide_id, startDate, endDate , returnedDate , returnedState, notes) async
  {
    Uri url= Uri.parse('$BASE_URL/update_request');

    // print('Data');
    // print('user ${user_id} make request for slide id = ${slide_id}');
    // print(startDate);
    // print(endDate);
    // print(returnedDate);
    // print(returnedState);
    // print(notes);
    try {
      http.Response response = await http.put(url, body:{
        'user_id': '${user_id}',
        'slide_id': '${slide_id}',
        'start_date':startDate,
        'end_date':endDate,
        'returned_date': returnedDate,
        'notes':notes,
        'returned_state':returnedState,
      });

      if (response.statusCode == 200) {
        // Successful PUT request
        print('POST Update request successful!');
        print('Response body: ${response.body}');
      } else {
        // Handle error response
        print(
            'POST Update request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle request failure
      print('Error making POST Update request: $error');
    }

  }
}