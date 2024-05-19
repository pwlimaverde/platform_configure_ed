import 'package:firebase_core/firebase_core.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import 'features/features_service_presenter.dart';
import 'service_bindings.dart';

Future<void> startServices({required FirebaseOptions options}) async {
  await Service.to
      .initDependences(() async => ServiceBindings().dependencies());
  await Service.to.initServices([
    FeaturesServicePresenter.to.widgetsFlutterBindingService(),
    FeaturesServicePresenter.to.dartPluginRegistrantService(),
    FeaturesServicePresenter.to.firebaseInitService(options: options),
    FeaturesServicePresenter.to.permissionService(),
    FeaturesServicePresenter.to.localStorageService(),
    FeaturesServicePresenter.to.checkConnectService(),
  ]);
}
