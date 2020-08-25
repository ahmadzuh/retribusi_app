import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retribusi_app/bloc/viewModel/user_model.dart';
import 'package:retribusi_app/network/api/api.dart';

class Webservice {
  var token;
  User user = User();

  Future<User> login(String email, password) async {
    Map userdata = {
      'email': email,
      'password': password,
      'device_name': 'Mobile'
    };
    final response = await http.post(ApiService.loginUrl, body: userdata);
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // Future<User> changePassword(
  //     String old_password, new_password, confirm_new_password) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   var token = sharedPreferences.getString("token");
  //   Map resetPasswordData = {
  //     'old_password': old_password,
  //     'new_password': new_password,
  //     'confirm_new_password': confirm_new_password
  //   };
  //   final response = await http.post(
  //     '$url/user/changePassword',
  //     headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
  //     body: resetPasswordData,
  //   );

  //   if (response.statusCode == 200) {
  //     return User.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to change Password');
  //   }
  // }
}
