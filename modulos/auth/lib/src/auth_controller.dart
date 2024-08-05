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
        final result = await _setCurrentUser(account.id);
        if (!result) {
          signIn();
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

  Future<bool> signIn() async {
    if (usuario != null && account != null) {
      return true;
    }
    final signInResult = await FeaturesAuthPresenter.to.signIn();
    final userResult = await _setCurrentUser(account?.id ?? "0");
    if (signInResult && userResult) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signInAndroid() async {
    if (usuario != null && account != null) {
      return true;
    }
    final signInResult = await FeaturesAuthPresenter.to.signInAndroid();

    final userResult = await _setCurrentUser(account?.id ?? "0");
    if (signInResult && userResult) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signOut() async {
    final result = await FeaturesAuthPresenter.to.signOut();
    if (result) {
      _usuario.value = null;
      _account.value = null;
    }
    return result;
  }

  Future<bool> apagarConta(bool confirmacao) async {
    if (usuario != null && account != null) {
      final result = await FeaturesAuthPresenter.to.apagarConta(
        id: usuario!.id,
        confirmacao: confirmacao,
      );
      if (result) {
        _account.value = null;
        _usuario.value = null;
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> _setCurrentAccount() async {
    final stream = await FeaturesAuthPresenter.to.currentAccountGoogle();
    _account.bindStream(stream);
  }

  Future<bool> _setCurrentUser(String id) async {
    final user = await FeaturesAuthPresenter.to.getUsuario(id);
    if (user != null) {
      final access = await FeaturesAuthPresenter.to.checarAutorizacaoGoogle();
      if (access) {
        _usuario(user);
        return true;
      } else {
        signOut();
        _account.value = null;
        _usuario.value = null;
        return false;
      }
    } else {
      return false;
    }
  }

  static AuthController get to => Get.find<AuthController>();
}
