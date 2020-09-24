import 'package:auto_route/auto_route_annotations.dart';

import '../../main_ui.dart';
import '../../pages/page_pengaturan/pengaturan_page.dart';
import '../../pages/page_riwayat/riwayat_page.dart';
import '../../pages/page_setoran/setoran_page.dart';
import '../../pages/page_tagihan/kelompok_retribusi.dart';
import '../../pages/page_tagihan/tagihan_page.dart';
import '../../screen/home_screen.dart';
import '../../screen/login_screen.dart';

@MaterialAutoRouter()
class $Router {
  // use @initial or @CupertinoRoute(initial: true) to annotate your initial route.
  @initial
  //AnimatedSplashScreen animatedSplashScreen;

  MainUI mainUI;
  LoginScreen loginScreen;
  HomeScreen homeScreen;

  Riwayat riwayat;
  Pengaturan pengaturan;
  Setoran setoran;

  Tagihan tagihan;
  KelompokRetribusi kelompokRetribusi;
}
