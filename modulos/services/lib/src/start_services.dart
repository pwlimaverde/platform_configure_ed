import 'package:dependencies/dependencies.dart';
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
    FeaturesServicePresenter.to.googleSignInService(),
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
