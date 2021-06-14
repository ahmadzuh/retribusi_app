import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retribusi_app/bloc/signin_bloc/signin_bloc.dart';
import 'package:retribusi_app/bloc/signin_bloc/signin_event.dart';
import 'package:retribusi_app/components/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();

  String nama, email;

  @override
  void initState() {
    super.initState();
    ProfilePreference();
  }

  // ignore: non_constant_identifier_names
  ProfilePreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = (preferences.getString('name') ?? '');
      email = (preferences.getString('email') ?? '');
    });
  }

  //themeData
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 98.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          child: Text(
                            nama ?? '...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 30.0,
                          child: Text(
                            email ?? '...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
