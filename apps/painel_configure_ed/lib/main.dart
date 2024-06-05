import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

import 'src/app_widget.dart';
import 'src/app_widget_animation.dart';
import 'src/utils/firebase_options.dart';

void main() async {
  runApp(
    const AppWidgetAnimation(),
  );
  await startServices(
    options: DefaultFirebaseOptions.currentPlatform,
    permissionInit: false,
    checkConnectInit: false,
    dartPluginInit: false,
  );
  // final teste = await FeaturesServicePresenter.to.externalStorage.read(Registro(colecao: "user", documento: "teste"), false);
  // Logger().i(teste);
  runApp(
    const AppWidget(),
  );
}
