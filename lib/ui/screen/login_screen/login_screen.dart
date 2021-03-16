import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import '../../../bloc/providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email, password;
  bool _isShowPassword = false;

  final TextEditingController emailController =
      TextEditingController(text: 'jurutagih@jambikota.go.id');
  final TextEditingController passwordController =
      TextEditingController(text: 'jambiterkini');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36.0,
                  ),
                  Text('Retribusi',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 50.0),
                  Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0)),
                  Container(
                    width: 30.0,
                    height: 5.0,
                    decoration: BoxDecoration(color: ColorBase.bluebase),
                  ),
                  SizedBox(height: 8.0),
                  Text('Bagi kamu yang sudah terdaftar, silakan login.',
                      style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 40.0),
                  textSection(user),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Lupa password?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  buttonSection(context, user),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonSection(context, user) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, right: 14),
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Login... ')));
              user.loginUser(emailController.text, passwordController.text);
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints:
                  BoxConstraints(maxWidth: double.infinity, minHeight: 50),
              child: Text(
                'MASUK',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
          txtEmail('Email', EvaIcons.email, user),
          SizedBox(height: 16.0),
          txtPassword('Kata sandi', Icons.lock),
        ],
      ),
    );
  }

  TextFormField txtEmail(String title, IconData icon, user) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter email';
        } else if (!value.contains('@')) {
          return 'Format alamat email salah. Mohon periksa kembali.';
        }
        return null;
      },
      controller: emailController,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        prefixIcon: Icon(EvaIcons.email),
        labelText: 'Email',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        //icon: Icon(icon),
      ),
    );
  }

  TextFormField txtPassword(String title, IconData icon) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Password harus diisi.';
        }
        return null;
      },
      controller: passwordController,
      obscureText: _isShowPassword ? false : true,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        labelText: 'Kata sandi',
        suffixIcon: IconButton(
          icon: Icon(
              !_isShowPassword ? EvaIcons.lockOutline : EvaIcons.unlockOutline),
          onPressed: () {
            setState(() {
              if (!_isShowPassword) {
                _isShowPassword = true;
              } else {
                _isShowPassword = false;
              }
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusColor: Colors.green,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(EvaIcons.lock),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
            )),
        //icon: Icon(icon),
      ),
    );
  }
}
