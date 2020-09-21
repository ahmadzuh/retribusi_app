import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/providers/user_provider.dart';
import '../common/const/dictionary.dart';
import '../common/const/font.dart';
import '../common/environment/environment.dart';

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
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 26.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(Dictionary.selamatDatang,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontsFamily.latoReguler,
                      )),
                  SizedBox(height: 6.0),
                  Text(Dictionary.appSubtitle,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: FontsFamily.openSansReguler,
                          fontWeight: FontWeight.w300)),
                  Image.asset('${Environment.imageAssets}login.png'),
                  SizedBox(height: 20.0),
                  Container(child: textSection(user)),
                  buttonSection(context, user),
                  SizedBox(height: 10.0),
                ]),
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
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        labelText: title,
        hintStyle: TextStyle(color: Colors.grey),
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
        prefixIcon: Icon(Icons.lock),
        focusColor: Colors.green,
        border: OutlineInputBorder(),
        labelText: title,
        hintStyle: TextStyle(color: Colors.grey),
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
      ),
    );
  }

  buttonSection(context, user) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      margin: EdgeInsets.only(top: 16.0, right: 14),
      child: RaisedButton(
        elevation: 0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Log In ')));
            user.loginUser(emailController.text, passwordController.text);
          }
        },
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
