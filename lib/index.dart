import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retribusi_app/screens/navbar_home_screen.dart/navbar_home_screen.dart';
import 'screens/signin_screen/signin_screen.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/auth_bloc/auth_state.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print(state);
        if (state is Authenticated) {
          return NavbarHomeScreen();
        }
        if (state is Unauthenticated) {
          return SignInScreen();
        }
        return Container();
      },
    );
  }
}
