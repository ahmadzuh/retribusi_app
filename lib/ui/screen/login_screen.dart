import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/providers/user_provider.dart';
import '../common/const/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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

  //textforField password
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

  //textforField password
  TextFormField txtPassword(String title, IconData icon) {
    return TextFormField(
      onChanged: null,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password harus diisi.';
        }
        return null;
      },
      controller: passwordController,
      obscureText: _obscureText,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
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
      child: FlatButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Log In ')));
            user.loginUser(emailController.text, passwordController.text);
          }
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
    );
  }
}
