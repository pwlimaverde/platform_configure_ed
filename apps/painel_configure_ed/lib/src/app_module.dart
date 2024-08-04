import 'package:dependencies/dependencies.dart';

import 'module/login/login_module.dart';

final class AppModule implements Module {
  @override
  List<GetPage> routes = [
    ...LoginModule().routes,
  ];
}
