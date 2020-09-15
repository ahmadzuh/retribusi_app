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
import 'package:retribusi_app/ui/pages/page_history/history_page.dart';
import 'package:retribusi_app/ui/pages/page_pengaturan/pengaturan_page.dart';
import 'package:retribusi_app/ui/pages/page_setoran/setoran_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/tagihan_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/detail_tagihan.dart';
import 'package:retribusi_app/bloc/view_model/area_tagih_model.dart';
import 'package:retribusi_app/bloc/view_model/kelompok_retribusi_model.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/kelompok_retribusi.dart';

abstract class Routes {
  static const mainUI = '/';
  static const loginScreen = '/login-screen';
  static const homeScreen = '/home-screen';
  static const history = '/history';
  static const pengaturan = '/pengaturan';
  static const setoran = '/setoran';
  static const tagihan = '/tagihan';
  static const tagihanDetail = '/tagihan-detail';
  static const kelompokRetribusi = '/kelompok-retribusi';
  static const all = {
    mainUI,
    loginScreen,
    homeScreen,
    history,
    pengaturan,
    setoran,
    tagihan,
    tagihanDetail,
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
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.history:
        return MaterialPageRoute<dynamic>(
          builder: (context) => History(),
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
      case Routes.tagihanDetail:
        if (hasInvalidArgs<TagihanDetailArguments>(args)) {
          return misTypedArgsRoute<TagihanDetailArguments>(args);
        }
        final typedArgs =
            args as TagihanDetailArguments ?? TagihanDetailArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => TagihanDetail(
              areaTagih: typedArgs.areaTagih, datum: typedArgs.datum),
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
              datum: typedArgs.datum, areaTagih: typedArgs.areaTagih),
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

//TagihanDetail arguments holder class
class TagihanDetailArguments {
  final AreaTagih areaTagih;
  final Datum datum;
  TagihanDetailArguments({this.areaTagih, this.datum});
}

//KelompokRetribusi arguments holder class
class KelompokRetribusiArguments {
  final Datum datum;
  final AreaTagih areaTagih;
  KelompokRetribusiArguments({this.datum, this.areaTagih});
}
