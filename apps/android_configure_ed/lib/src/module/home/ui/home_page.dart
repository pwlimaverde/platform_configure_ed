import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

final class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(backgroundColor: Colors.white,),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    controller.logOut(
                      onSuccess: () {
                        Get.snackbar("Sucesso", "Sucesso ao fazer LogOut");
                        Get.offAllNamed(Routes.login.caminho);
                      },
                      onFail: () {
                        Get.snackbar("Erro", "Erro ao fazer LogOut");
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            ),
          ),
        ],
      ),
    );
  }
}
