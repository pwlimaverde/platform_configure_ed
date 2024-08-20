import 'dart:ui';

import 'package:dependencies/dependencies.dart';

import '../../features/features_login_presenter.dart';

class LoginController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await _getIdentificacao();
  }

  final identificacao = "".obs;

  Future<void> _getIdentificacao() async {
    identificacao(
      await FeaturesLoginPresenter.to.getIdentificacao(),
    );
  }

  Future<void> setIdentificacao(String apelido) async {
    await FeaturesLoginPresenter.to.setIdentificacao(apelido);
    await _getIdentificacao();
  }

  Future<void> signInGoogleLogin({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      if (identificacao.value.isNotEmpty) {
        final result = await AuthController.to.signIn(identificacao.value);

        if (result) {
          onSuccess();
        } else {
          onFail();
        }
      } else {
        onFail();
      }
    } catch (e) {
      onFail();
    }
  }

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
