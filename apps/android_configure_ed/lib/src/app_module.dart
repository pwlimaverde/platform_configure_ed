import 'package:dependencies/dependencies.dart';

import 'module/home/home_module.dart';
import 'module/login/login_module.dart';
import 'module/splash/splash_module.dart';

final class AppModule implements Module {
  @override
  List<GetPage> routes = [
    ...SplashModule().routes,
    ...HomeModule().routes,
    ...LoginModule().routes,
  ];
}
