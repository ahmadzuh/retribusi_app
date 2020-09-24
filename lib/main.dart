import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:retribusi_app/bloc/providers/user_provider.dart';
import 'package:retribusi_app/ui/common/const/color.dart';
import 'package:retribusi_app/ui/common/route/router.gr.dart';
import 'package:retribusi_app/ui/main_ui.dart';

// //simple do more
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
        //  ChangeNotifierProvider<SharedPrefs>(
        //    create: (_) => SharedPrefs(),
        //    lazy: false,
        //  )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorBase.bluebase,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Retribusi',
        color: Colors.white,
        onGenerateRoute: Router().onGenerateRoute,
        home: Scaffold(body: MainUI()),
      ),
    );
  }
}
