import 'package:dependencies/dependencies.dart';

import 'auth_binding.dart';
import 'ui/login/login_page.dart';

final class AuthModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: Routes.initial.caminho,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    )
  ];
}
