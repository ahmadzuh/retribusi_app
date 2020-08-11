import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/main_ui.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
          lazy: false,
        ),

        //  ChangeNotifierProvider<SharedPrefs>(
        //    create: (_) => SharedPrefs(),
        //    lazy: false,
        //  )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Retribusi',
        home: Scaffold(body: MainUI()),
      ),
    );
  }
}
