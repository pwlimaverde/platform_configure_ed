import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../auth_controller.dart';

import '../../features/features_auth_presenter.dart';
import 'widgets/sign_in_button/componentes/mobile.dart';

class LoginPage extends GetView<AuthController> {
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
                  onPressed: () {
                    FeaturesAuthPresenter.to.novaConta();
                    // controller.signInGoogleLogin(
                    //   onSuccess: () {
                    //     Get.snackbar(
                    //       "Bem vindo",
                    //       'Login efetuado com sucesso',
                    //       icon: const Icon(FontAwesomeIcons.check),
                    //       snackPosition: SnackPosition.BOTTOM,
                    //     );
                    //     Future.delayed(const Duration(seconds: 2)).then((_) {
                    //       Get.offAllNamed(Routes.home.caminho);
                    //     });
                    //   },
                    //   onFail: () {
                    //     Get.snackbar(
                    //       'Olá',
                    //       'Não foi possível fazer o login',
                    //       icon: const Icon(FontAwesomeIcons.faceMeh),
                    //       snackPosition: SnackPosition.BOTTOM,
                    //     );
                    //   },
                    // );
                  },
                  icon: const FaIcon(FontAwesomeIcons.newspaper)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: FeaturesAuthPresenter.to.signIn,
                  icon: const FaIcon(FontAwesomeIcons.google)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: FeaturesAuthPresenter.to.signOut,
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            ),
          ),
        ],
      ),
    );
  }
}
