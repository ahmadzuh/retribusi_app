// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:retribusi_app/ui/main_ui.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/setting_screen.dart';

abstract class Routes {
  static const mainUI = '/';
  static const loginScreen = '/login-screen';
  static const homeScreen = '/home-screen';
  static const settingScreen = '/setting-screen';
  static const all = {
    mainUI,
    loginScreen,
    homeScreen,
    settingScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MainUI(),
          settings: settings,
        );
      case Routes.loginScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.settingScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
