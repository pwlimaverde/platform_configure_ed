import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'app_module.dart';

final class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Painel de controle ED',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AuthBinding(),
      getPages: AppModule().routes,
    );
  }
}
