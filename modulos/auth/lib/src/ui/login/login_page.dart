import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../auth_controller.dart';

import '../../features/features_auth_presenter.dart';

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
