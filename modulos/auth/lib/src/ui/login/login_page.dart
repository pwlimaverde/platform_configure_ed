import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import '../../auth_controller.dart';

import 'widgets/sign_in_button/componentes/mobile.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(()=>_buildBody(controller)),
      // Column(
      //   children: [
      //     Center(
      //       child: SizedBox(
      //         width: 80,
      //         height: 80,
      //         child: IconButton(
      //             onPressed: () {
      //               controller.signInGoogleLogin(
      //                 onSuccess: () {
      //                   Get.snackbar(
      //                     "Bem vindo",
      //                     'Login efetuado com sucesso',
      //                     icon: const Icon(FontAwesomeIcons.check),
      //                     snackPosition: SnackPosition.BOTTOM,
      //                   );
      //                   Future.delayed(const Duration(seconds: 2)).then((_) {
      //                     Get.offAllNamed(Routes.home.caminho);
      //                   });
      //                 },
      //                 onFail: () {
      //                   Get.snackbar(
      //                     'Olá',
      //                     'Não foi possível fazer o login',
      //                     icon: const Icon(FontAwesomeIcons.faceMeh),
      //                     snackPosition: SnackPosition.BOTTOM,
      //                   );
      //                 },
      //               );
      //             },
      //             icon: const FaIcon(FontAwesomeIcons.google)),
      //       ),
      //     ),
      //     Center(
      //       child: SizedBox(
      //         width: 80,
      //         height: 80,
      //         child: IconButton(
      //             onPressed: controller.logOut,
      //             icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

Widget _buildBody(AuthController controller) {
  final GoogleSignInAccount? user = controller.currentUser.value;
  if (user != null) {
    // The user is Authenticated
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ListTile(
          leading: GoogleUserCircleAvatar(
            identity: user,
          ),
          title: Text(user.displayName ?? ''),
          subtitle: Text(user.email),
        ),
        const Text('Signed in successfully.'),
        if (controller.isAuthorized.value) ...<Widget>[
          // The user has Authorized all required scopes
          Text(controller.contactText.value),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => controller.handleGetContact(user),
          ),
        ],
        if (!controller.isAuthorized.value) ...<Widget>[
          // The user has NOT Authorized all required scopes.
          // (Mobile users may never see this button!)
          const Text('Additional permissions needed to read your contacts.'),
          ElevatedButton(
            onPressed: controller.handleAuthorizeScopes,
            child: const Text('REQUEST PERMISSIONS'),
          ),
        ],
        ElevatedButton(
          onPressed: controller.handleSignOut,
          child: const Text('SIGN OUT'),
        ),
      ],
    );
  } else {
    // The user is NOT Authenticated
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text('You are not currently signed in.'),
        // This method is used to separate mobile from web code with conditional exports.
        // See: src/sign_in_button.dart
        buildSignInButton(
          onPressed: controller.handleSignIn,
        ),
      ],
    );
  }
}
