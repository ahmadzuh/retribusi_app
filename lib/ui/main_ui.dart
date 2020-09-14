import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';

class MainUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, user, child) {
      switch (user.status) {
        case Status.Unauthenticated:
          return LoginScreen();

        case Status.Authenticated:
          return HomeScreen();

        case Status.Authenticating:
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );

        default:
          return LoginScreen();
      }
    });
  }
}
