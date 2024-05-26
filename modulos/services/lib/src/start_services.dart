import 'package:dependencies_module/dependencies_module.dart';

import 'features/features_service_presenter.dart';
import 'service_bindings.dart';

Future<void> startServices({
  required FirebaseOptions options,
  required bool dartPluginInit,
  required bool permissionInit,
  required bool checkConnectInit,
}) async {
  await Service.to
      .initDependences(() async => ServiceBindings().dependencies());

  List<Future<dynamic>> sevisesInit = [
    FeaturesServicePresenter.to.widgetsFlutterBindingService(),
    FeaturesServicePresenter.to.firebaseInitService(options: options),
    FeaturesServicePresenter.to.localStorageService(),
  ];

  if (dartPluginInit) {
    sevisesInit.add(FeaturesServicePresenter.to.dartPluginRegistrantService());
  }
  if (permissionInit) {
    sevisesInit.add(FeaturesServicePresenter.to.permissionService());
  }
  if (checkConnectInit) {
    sevisesInit.add(FeaturesServicePresenter.to.checkConnectService());
  }


  await Service.to.initServices(sevisesInit);
}