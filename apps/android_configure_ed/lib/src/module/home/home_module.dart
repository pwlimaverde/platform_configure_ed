import 'package:dependencies/dependencies.dart';


import 'home_binding.dart';
import 'ui/home_page.dart';
final class HomeModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: Routes.home.caminho,
      page: () => const HomePage(),
      bindings: [AuthBinding(), HomeBinding()],
    )
  ];
}
