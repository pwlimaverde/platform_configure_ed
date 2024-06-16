

import 'package:dependencies/dependencies.dart';

final class AppModule implements Module {
  @override
  List<GetPage> routes = [
    ...AuthModule().routes,
  ];
}
