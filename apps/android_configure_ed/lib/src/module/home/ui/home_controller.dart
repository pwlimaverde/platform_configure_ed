import 'dart:ui';

import 'package:dependencies/dependencies.dart';


class HomeController extends GetxController {
  Future<void> logOut({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    final result = await AuthController.to.signOut();
    if (result) {
      onSuccess();
    } else {
      onFail();
    }
  }
}
