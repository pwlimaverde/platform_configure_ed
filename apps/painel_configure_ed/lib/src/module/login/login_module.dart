import 'package:dependencies/dependencies.dart';

import 'login_binding.dart';
import 'ui/login/login_page.dart';

final class LoginModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: Routes.initial.caminho,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    )
  ];
}
