import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/viewModel/area_tagih_model.dart';
import 'package:retribusi_app/bloc/viewModel/user_model.dart';
import 'package:retribusi_app/network/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:retribusi_app/ui/common/util/toast_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Webservice {
  UserModel userModel = UserModel();
  AreaTagih areatagih = AreaTagih();

  //Api Data Login
  Future<UserModel> login(String email, password) async {
    Map userdata = {
      'email': email,
      'password': password,
      'device_name': 'Mobile'
    };
    final response = await http.post(ApiService.loginUrl, body: userdata);
    if (response.statusCode == 200) {
      print(response.body);
      return UserModel.fromJson(json.decode(response.body));
    } else {
      ToastUtils.show('Gagal Load Data');
    }
    return null;
  }

  /*getData from Api to List*/
  Future<List<AreaTagih>> areaTagih() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await http.get(
      ApiService.listUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['area_tagih'];
      print(jsonResponse);
      return jsonResponse.map((job) => new AreaTagih.fromJson(job)).toList();
    } else {
      ToastUtils.show('Gagal load data');
      throw Exception('Failed to load jobs from API');
    }
  }
}

ListView jobsListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].nmPasar, data[index].keterangan, Icons.work);
      });
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
      title: Text(title,
          style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ) ??
              'default value'),
      subtitle: Text(subtitle) ?? 'default_value',
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );

//   Future<User> changePassword(
//       String old_password, new_password, confirm_new_password) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString("token");
//     Map resetPasswordData = {
//       'old_password': old_password,
//       'new_password': new_password,
//       'confirm_new_password': confirm_new_password
//     };
//     final response = await http.post(
//       '$url/user/changePassword',
//       headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
//       body: resetPasswordData,
//     );

//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to change Password');
//     }
//   }
// }
