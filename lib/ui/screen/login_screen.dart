import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/common/const/dictionary.dart';
import 'package:retribusi_app/ui/common/const/font.dart';
import 'package:retribusi_app/ui/common/environment/environment.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                  Image.asset('${Environment.imageAssets}image_login.png'),
                  SizedBox(height: 20.0),
                  Container(child: textSection(user)),
                  buttonSection(context, user)
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
          SizedBox(height: 30.0),
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
          return 'Please enter email';
        } else if (!value.contains('@')) {
          return 'Please enter valid email';
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
          return 'Please enter password';
        }
        return null;
      },
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        focusColor: Colors.green,
        border: OutlineInputBorder(),
        labelText: title,
        hintStyle: TextStyle(color: Colors.grey),
//        icon: Icon(icon),
      ),
    );
  }

  buttonSection(context, user) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.only(top: 30.0, right: 14),
      child: RaisedButton(
        elevation: 0,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Signing in ')));
            user.loginUser(emailController.text, passwordController.text);
          }
        },
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
