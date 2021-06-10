import 'package:dio/dio.dart';
import '../services/base_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Auth {
  Future<Response> signIn({String email, String password, String deviceName});
  Future<bool> hasToken();
  Future<void> persistToken(String token);
  Future<void> deleteToken();
}

class AuthRepository extends BaseService implements Auth {
  @override
  Future<Response> signIn(
      {String email, String password, String deviceName}) async {
    Response response = await request(
        endpoint: 'api/v1/login',
        data: FormData.fromMap(
            {'email': email, 'password': password, 'device_name': 'Mobile'}),
        requestType: RequestType.POST);

    return response;
  }

  Future<void> deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
  }

  Future<bool> hasToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('token');
    return _token != null;
  }

  Future<void> persistToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }
}
