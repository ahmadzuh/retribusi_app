import 'package:flutter/material.dart';
import 'package:retribusi_app/common/route/router.gr.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';

void main() {
  runApp(MainUI());
}

class MainUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retribusi App',
      theme: ThemeData(primaryColor: Colors.white),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
