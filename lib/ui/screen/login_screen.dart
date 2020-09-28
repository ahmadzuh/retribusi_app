import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {'email': '', 'password': ''};

  Future _submit() async {
    if (!_formKey.currentState.validate()) {
      //invalid
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<UserProvider>(context, listen: false)
          .loginUser(_authData['email'], _authData['password']);
    } on HttpException catch (e) {
      var errorMessage = 'Authentication Failed';
      if (e.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Invalid email';
        _showerrorDialog(errorMessage);
      } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'This email not found';
        _showerrorDialog(errorMessage);
      } else if (e.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid Password';
        _showerrorDialog(errorMessage);
      }
    } catch (e) {
      var errorMessage = 'Username atau Password Salah';
      _showerrorDialog(errorMessage);
    }
  }

  String email;
  String password;

  final TextEditingController emailController =
      TextEditingController(text: 'jurutagih@jambikota.go.id');
  final TextEditingController passwordController =
      TextEditingController(text: 'jambiterkini');

  // Initially password is obscure
  bool _obscureText = true;

  // toggle password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Selamat Datang,",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Login untuk Melanjutkan!",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.23),
                        Container(child: textSection(user)),
                        buttonSection(context, user),
                        SizedBox(height: 14.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Butuh bantuan ?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Coba Lagi',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Oke'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  textSection(user) {
    return Container(
      padding: EdgeInsets.only(right: 14.0),
      child: Column(
        children: <Widget>[
          txtEmail("Email", Icons.email, user),
          SizedBox(height: 16.0),
          txtPassword("Password", Icons.lock),
        ],
      ),
    );
  }

  TextFormField txtEmail(String title, IconData icon, user) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Email harus diisi.';
        } else if (!value.contains('@')) {
          return 'Format alamat email salah. Mohon periksa kembali.';
        }
        return null;
      },
      onSaved: (value) {
        _authData['email'] = value;
      },
      controller: emailController,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        labelText: "Email ID",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
      ),
    );
  }

  TextFormField txtPassword(String title, IconData icon) {
    return TextFormField(
      onChanged: null,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password harus diisi.';
        }
        return null;
      },
      onSaved: (value) {
        _authData['password'] = value;
      },
      controller: passwordController,
      obscureText: _obscureText,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            _toggle();
          },
        ),
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
      ),
    );
  }

  buttonSection(context, user) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      margin: EdgeInsets.only(top: 16.0, right: 14),
      child: Builder(
        builder: (context) => FlatButton(
          onPressed: () {
            _submit();
          },
          padding: EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffa4bfd9),
                  Color(0xff0088ff),
                  Color(0xff8bb9dd),
                ],
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints:
                  BoxConstraints(maxWidth: double.infinity, minHeight: 50),
              child: Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
