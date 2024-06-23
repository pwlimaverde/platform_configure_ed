import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
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
  runApp(
    const AppWidget(),
  );
  
}
