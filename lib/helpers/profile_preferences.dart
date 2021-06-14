import 'package:shared_preferences/shared_preferences.dart';

class ProfilePreference {
  //set username
  static void setProfile(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', url);
  }

  static Future<String> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pic = pref.getString('name');
    return pic;
  }

  static Future<void> removeProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('name');
  }

  //set email
  static void setEmail(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', url);
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pic = pref.getString('email');
    return pic;
  }

  static Future<void> removeEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('email');
  }
}
