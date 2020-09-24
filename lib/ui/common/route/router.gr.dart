// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';
import 'package:retribusi_app/bloc/view_model/kelompok_retribusi_model.dart';
import 'package:retribusi_app/ui/main_ui.dart';
import 'package:retribusi_app/ui/pages/page_pengaturan/pengaturan_page.dart';
import 'package:retribusi_app/ui/pages/page_riwayat/riwayat_page.dart';
import 'package:retribusi_app/ui/pages/page_setoran/setoran_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/kelompok_retribusi.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/tagihan_page.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';

abstract class Routes {
  static const mainUI = '/';
  static const loginScreen = '/login-screen';
  static const homeScreen = '/home-screen';
  static const riwayat = '/riwayat';
  static const pengaturan = '/pengaturan';
  static const setoran = '/setoran';
  static const tagihan = '/tagihan';
  static const kelompokRetribusi = '/kelompok-retribusi';
  static const all = {
    mainUI,
    loginScreen,
    homeScreen,
    riwayat,
    pengaturan,
    setoran,
    tagihan,
    kelompokRetribusi,
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
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.mainUI:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MainUI(),
          settings: settings,
        );
      case Routes.loginScreen:
        if (hasInvalidArgs<LoginScreenArguments>(args)) {
          return misTypedArgsRoute<LoginScreenArguments>(args);
        }
        final typedArgs =
            args as LoginScreenArguments ?? LoginScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.riwayat:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Riwayat(),
          settings: settings,
        );
      case Routes.pengaturan:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Pengaturan(),
          settings: settings,
        );
      case Routes.setoran:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Setoran(),
          settings: settings,
        );
      case Routes.tagihan:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Tagihan(),
          settings: settings,
        );
      case Routes.kelompokRetribusi:
        if (hasInvalidArgs<KelompokRetribusiArguments>(args)) {
          return misTypedArgsRoute<KelompokRetribusiArguments>(args);
        }
        final typedArgs =
            args as KelompokRetribusiArguments ?? KelompokRetribusiArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => KelompokRetribusi(
              areaTagih: typedArgs.areaTagih, retkel: typedArgs.retkel),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  LoginScreenArguments({this.key});
}

//KelompokRetribusi arguments holder class
class KelompokRetribusiArguments {
  final AreaTagih areaTagih;
  final Retkel retkel;
  KelompokRetribusiArguments({this.areaTagih, this.retkel});
}
