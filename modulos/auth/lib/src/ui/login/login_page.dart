import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../auth_controller.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: (){
                    controller.signInGoogleLogin(
                      onSuccess: () {
                        Get.snackbar("Sucesso", "Sucesso ao fazer login");
                      },
                      onFail: () {
                        Get.snackbar("Erro", "Erro ao fazer login");
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.google)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: controller.logOut,
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: controller.testeSig,
                  icon: const FaIcon(FontAwesomeIcons.adn)),
            ),
          ),
        ],
      ),
    );
  }
}
