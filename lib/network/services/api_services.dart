import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';
import 'package:retribusi_app/bloc/view_model/kelompok_retribusi_model.dart';
import 'package:retribusi_app/bloc/view_model/login_user_model.dart';
import 'package:retribusi_app/network/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:retribusi_app/network/services/app_exceptions.dart';
import 'package:retribusi_app/ui/common/util/toast_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Webservice {
  LoginUserModel userModel = LoginUserModel();

  //service data untuk login
  Future<LoginUserModel> login(String email, password) async {
    Map userdata = {
      'email': email,
      'password': password,
      'device_name': 'Mobile'
    };
    final response = await http.post(ApiService.loginUrl, body: userdata);
    if (response.statusCode == 200) {
      print(response.body);
      return LoginUserModel.fromJson(json.decode(response.body));
    } else {
      ToastUtils.show('Gagal Load Data');
    }
    return null;
  }

  Future<List<AreaTagih>> areaTagih() async {
    try {
      List<AreaTagih> list;
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');

      final response = await http.get(ApiService.listUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      switch (response.statusCode) {
        case 200:
          var data = json.decode(response.body);
          var rest = data['area_tagih'] as List;
          list =
              rest.map<AreaTagih>((json) => AreaTagih.fromJson(json)).toList();
          return list;
        case 400:
          throw BadRequestException(response.body);
        case 401:
        case 403:
          throw UnauthorisedException(response.body);
        case 500:
        default:
          throw FetchDataException(
              'Terjadi kesalahan saat Komunikasi dengan Server dengan Kode Status : ${response.body}');
      }
    } on SocketException {
      throw FetchDataException('Tidak ada Koneksi Internet');
    }
  }
}

Future<List<KelompokRetribusiModel>> kelompokRetribusi() async {
  try {
    return null;
  } catch (e) {
    return null;
  }
}

//konversi respon dari API ke class model Area Tagih
ListView areaTagihListView(data) {
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

/*response lama
mendapatkan data dari API List Area tagih {Json object dan array}
  Future<List<AreaTagih>> areaTagih() async {
    try {
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
        return jsonResponse
            .map((areatagih) => new AreaTagih.fromJson(areatagih))
            .toList();
      } else {
        ToastUtils.show('Gagal mengambil data');
        throw Exception('Failed to load Area Tagih from API');
      }
    } catch (e) {
      print(e);
      throw Exception('Data Error');
    }
  }
}
*/

/*response ganti password
  Future<User> changePassword(
      String old_password, new_password, confirm_new_password) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map resetPasswordData = {
      'old_password': old_password,
      'new_password': new_password,
      'confirm_new_password': confirm_new_password
    };
    final response = await http.post(
      '$url/user/changePassword',
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + token},
      body: resetPasswordData,
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to change Password');
    }
  }
}
*/
