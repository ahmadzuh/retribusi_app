import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../bloc/view_model/registrasi_tempat/regitrasi_tempat_model.dart';
import '../../bloc/view_model/area_model/area_tagih_model.dart';
import '../../bloc/view_model/kelompok_model/kelompok_retribusi_model.dart';
import '../../bloc/view_model/login_model/login_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_url.dart';
import 'app_exceptions.dart';

class Webservice {
  LoginUserModel userModel = LoginUserModel();

  Future<LoginUserModel> login(String email, password) async {
    Map userdata = {
      'email': email,
      'password': password,
      'device_name': 'Mobile'
    };
    final response = await http.post(ApiUrl.loginUrl, body: userdata);
    if (response.statusCode == 200) {
      print(response.body);
      return LoginUserModel.fromJson(json.decode(response.body));
    } else {
      // ToastUtils.show('Oops... Jaringan terputus cek koneksi anda');
    }
    return null;
  }

  Future<List<AreaTagih>> areaTagih() async {
    try {
      List<AreaTagih> list;
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      final response = await http.get(ApiUrl.areaTagihUrl, headers: {
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
      throw FetchDataException('Coba hubungkan ulang ke Internet');
    }
  }

  Future<List<Retkel>> kelompokRetribusi(int id) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      final response = await http.get(
        '${ApiUrl.kelompokRetribusiUrl}/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['retkel'];
        print(jsonResponse);
        return jsonResponse.map((retkel) => Retkel.fromJson(retkel)).toList();
      } else {
        // ToastUtils.show('Gagal mengambil data');
        print(response);
        throw Exception('Failed to load Area Tagih from API');
      }
    } catch (e) {
      print(e);
      throw Exception('Data Error');
    }
  }

  Future<List<RegistrasiTempat>> registrasiTempat(int id) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      final response = await http.get(
        '${ApiUrl.registrasiTempatUrl}/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['registrasi_tempat'];
        print(jsonResponse);
        return jsonResponse
            .map((registrasiTempat) =>
                RegistrasiTempat.fromJson(registrasiTempat))
            .toList();
      } else {
        // ToastUtils.show('Gagal mengambil data');
        print(response);
        throw Exception('$response');
      }
    } catch (e) {
      print(e);
      throw Exception('Data Error');
    }
  }
}
