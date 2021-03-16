import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ui/main_ui.dart';

import 'bloc/providers/user_provider.dart';
import 'ui/common/const/color.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorBase.bluebase, //or set color with: Color(0xFF0000FF)
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorBase.bluebase,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Retribusi',
        color: Colors.white,
        home: Scaffold(body: MainUI()),
      ),
    );
  }
}
