import 'package:dio/dio.dart';

import '../helpers/shared_preferences.dart';
import 'interceptor_services.dart';

enum RequestType { GET, POST, PUT, DELETE }

class BaseService {
  Dio _dio = new Dio();

  Future<dynamic> request(
      {RequestType requestType, dynamic data, String endpoint}) async {
    _dio.interceptors.add(HeaderInterceptor());
    Response _response;

    try {
      switch (requestType) {
        case RequestType.GET:
          _response = await _dio.get(endpoint);
          break;
        case RequestType.POST:
          _response = await _dio.post(endpoint, data: data);
          break;
        case RequestType.PUT:
          _response = await _dio.put(endpoint, data: data);
          break;
        case RequestType.DELETE:
          _response = await _dio.delete(endpoint);
          break;
        default:
          break;
      }
    } on DioError catch (e) {
      print(e);
      _response = Response(data: e.response.data);
    }
    return _response;
  }

  Dio dio() {
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.baseUrl = 'https://retribusi.jambikota.go.id/';
      final token = await TokenPref.getToken();
      if (token != null) {
        print('token <========================> $token');
        options.headers['authorization'] = 'Bearer $token';
      }
      return options;
    }));
    return dio;
  }
}
