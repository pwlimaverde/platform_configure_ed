import 'package:flutter/material.dart';
import 'src/app_widget_animation.dart';

void main() async {
  // await startServices(
  //   options: DefaultFirebaseOptions.currentPlatform,
  //   permissionInit: false,
  //   checkConnectInit: false,
  //   dartPluginInit: false,
  // );
  runApp(
    const AppWidgetAnimation(),
  );
  
  // final teste = await FeaturesServicePresenter.to.externalStorage.read(Registro(colecao: "user", documento: "teste"), false);
  // Logger().i(teste);
  // runApp(
  //   const AppWidget(),
  // );
  
}
