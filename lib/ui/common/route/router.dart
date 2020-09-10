import 'package:auto_route/auto_route_annotations.dart';
import 'package:retribusi_app/ui/main_ui.dart';
import 'package:retribusi_app/ui/pages/page_history/history_page.dart';
import 'package:retribusi_app/ui/pages/page_pengaturan/pengaturan_page.dart';
import 'package:retribusi_app/ui/pages/page_setoran/setoran_page.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/detail_tagihan.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/kelompok_retribusi.dart';
import 'package:retribusi_app/ui/pages/page_tagihan/tagihan_page.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';

@MaterialAutoRouter()
class $Router {
  // use @initial or @CupertinoRoute(initial: true) to annotate your initial route.
  @initial
  //AnimatedSplashScreen animatedSplashScreen;

  MainUI mainUI;
  LoginScreen loginScreen;
  HomeScreen homeScreen;

  History history;
  Pengaturan pengaturan;
  Setoran setoran;

  Tagihan tagihan;
  TagihanDetail tagihanDetail;
  KelompokRetribusi kelompokRetribusi;
}
