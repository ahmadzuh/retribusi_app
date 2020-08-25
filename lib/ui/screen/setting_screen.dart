import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final userLogOut = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
              onPressed: () {
                userLogOut.signOut();
                Navigator.pop(context);
              },
              child: Text('Keluar')),
        ),
      ),
    );
  }
}
