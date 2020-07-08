import 'package:auto_route/auto_route_annotations.dart';

import '../modules/home_page.dart';
import '../modules/login_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeScreen homeScreen;

  LoginPage loginPage;
}
