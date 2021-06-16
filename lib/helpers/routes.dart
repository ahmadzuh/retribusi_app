import 'package:flutter/material.dart';
import '../screens/setting_screen/edit_screen.dart';
import '../screens/navbar_screen.dart/navbar_screen.dart';
import '../screens/signin_screen/signin_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

import '../index.dart';

MaterialPageRoute _pageRoute(
        {Widget builder, RouteSettings settings, bool isFullScreen = false}) =>
    MaterialPageRoute(
        builder: (_) => builder,
        settings: settings,
        fullscreenDialog: isFullScreen);

// ignore: missing_return
Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _pageRoute(builder: SplashScreen(), settings: settings);
    case '/index':
      return _pageRoute(builder: Index(), settings: settings);
    case '/loginScreen':
      return _pageRoute(builder: SignInScreen(), settings: settings);
    case '/navbarScreen':
      return _pageRoute(builder: NavbarScreen(), settings: settings);
    case '/homeScreen':
      return _pageRoute(builder: HomeScreen(), settings: settings);
    case '/editScreen':
      return _pageRoute(builder: EditScreen(), settings: settings);
  }
}
