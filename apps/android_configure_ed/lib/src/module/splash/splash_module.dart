import 'package:dependencies/dependencies.dart';


import 'ui/splash_page.dart';
final class SplashModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: Routes.initial.caminho,
      page: () => const SplashPage(),
      binding: AuthBinding(),
    )
  ];
}
