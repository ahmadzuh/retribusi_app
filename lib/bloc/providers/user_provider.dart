import 'package:flutter/widgets.dart';
import 'package:retribusi_app/bloc/viewModel/area_tagih.dart';
import 'package:retribusi_app/bloc/viewModel/user_model.dart';
import 'package:retribusi_app/network/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  Status get status => _status;
  Status _status = Status.Unauthenticated;
  String isAuth;

  User user = User();

  String token;
  String name;
  String email;
  String password;

  UserProvider() {
    getUserToken();
    getUserName();
    getEmail();
  }
  Future<bool> loginUser(String email, password) async {
    final result = await Webservice().login(email, password);
    _status = Status.Authenticating;
    this.user = result;
    this.name = user.data.name;

    await setUserToken();

    //todo network validation
    _status = Status.Authenticated;

    print(user.status);
    notifyListeners();

    return null;
  }

  setUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("status", user.status);

    await sharedPreferences.setString("email", user.data.email);
    await sharedPreferences.setString("name", user.data.name);

    await sharedPreferences.setString("token", user.token);

    notifyListeners();
  }

  getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.token = prefs.getString("token");
    if (token == null) {
      _status = Status.Unauthenticated;
    } else {
      _status = Status.Authenticated;
    }
    notifyListeners();
    return this.token;
  }

  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.name = prefs.getString("name" ?? '');

    notifyListeners();
    return this.name;
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString("email" ?? '');

    return email;
  }

  deleteUserToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    _status = Status.Unauthenticated;
    print('Token Deleted $token');
    notifyListeners();
  }

  //fungsi delete token
  Future signOut() async {
    deleteUserToken();

    notifyListeners();
    return Future.delayed(Duration.zero); // need for type return
  }

  List<AreaTagih> areaTagih() {
    return null;
  }

  // Future<User> changePassword(
  //     String old_password, new_password, confirm_new_password) async {
  //   final result = await Webservice()
  //       .changePassword(old_password, new_password, confirm_new_password);

  //   print("Password change success");
  //   print(result);
  //   notifyListeners();
  // }

  /*Validasi Textformfield */
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      notifyListeners();
      return 'Email dibutuhkan';
    } else if (!regExp.hasMatch(value)) {
      notifyListeners();
      return 'Email salah';
    } else {
      notifyListeners();
      return null;
    }
  }
}
