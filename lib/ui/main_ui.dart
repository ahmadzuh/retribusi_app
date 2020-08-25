import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';

class MainUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);

    if (userprovider.status == Status.Unauthenticated) {
      return LoginScreen();
    } else if (userprovider.status == Status.Authenticated) {
      return HomeScreen();
    } else if (userprovider.status == Status.Authenticating) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return null;
  }
}
