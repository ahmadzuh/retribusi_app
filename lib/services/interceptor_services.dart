import 'package:dio/dio.dart';

import '../helpers/shared_preferences.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    options.baseUrl = 'https://retribusi.jambikota.go.id/';
    final token = await TokenPref.getToken();

    if (token != null) {
      print('token <===========================> $token');
      options.headers['authorization'] = 'Bearer $token';
    }
  }
}
