import 'package:auto_route/auto_route_annotations.dart';
import 'package:retribusi_app/ui/main_ui.dart';
import 'package:retribusi_app/ui/screen/home_screen.dart';
import 'package:retribusi_app/ui/screen/login_screen.dart';
import 'package:retribusi_app/ui/screen/setting_screen.dart';

@MaterialAutoRouter()
class $Router {
  // use @initial or @CupertinoRoute(initial: true) to annotate your initial route.
  @initial
  //AnimatedSplashScreen animatedSplashScreen;

  MainUI mainUI;
  LoginScreen loginScreen;
  HomeScreen homeScreen;
  SettingScreen settingScreen;
}
