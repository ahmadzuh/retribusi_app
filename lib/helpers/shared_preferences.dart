import 'package:shared_preferences/shared_preferences.dart';

class TokenPref {
  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.get('token');
    return token;
  }
}
