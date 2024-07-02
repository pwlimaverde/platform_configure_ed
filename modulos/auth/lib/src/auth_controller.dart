import 'dart:async';

import 'package:dependencies/dependencies.dart';

import 'features/features_auth_presenter.dart';

final class AuthController extends GetxController {
  final _usuario = Rxn<Usuario>();
  Usuario? get usuario => _usuario.value;

  final _account = Rxn<GoogleSignInAccount>();
  GoogleSignInAccount? get account => _account.value;

  @override
  void onInit() {
    super.onInit();
    _account.listen((account) async {
      if (account != null) {
        final user = await FeaturesAuthPresenter.to.getUsuario(account.id);
        final access = await FeaturesAuthPresenter.to.checarAutorizacaoGoogle();
        if (user != null && access == true) {
          _usuario(user);
        } else {
          signOut();
          _account.value = null;
          _usuario.value = null;
        }
      } else {
        _account.value = null;
        _usuario.value = null;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _setCurrentAccount();
  }

  Future<void> signIn() async {
    if (usuario != null && account != null) {
      return;
    }
    final signInResult = await FeaturesAuthPresenter.to.signIn();
    if (signInResult != null) {
      // _account(signInResult.account);
      // _usuario(signInResult.user);
    }
  }

  Future<void> signOut() async {
    final result = await FeaturesAuthPresenter.to.signOut();
    if (result) {
      _usuario.value = null;
      _account.value = null;
    }
  }

  Future<void> _setCurrentAccount() async {
    final stream = await FeaturesAuthPresenter.to.currentAccountGoogle();
    _account.bindStream(stream);
  }

  static AuthController get to => Get.find<AuthController>();
}
