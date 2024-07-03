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
        if (user != null) {
          final access =
              await FeaturesAuthPresenter.to.checarAutorizacaoGoogle();
          if (access) {
            _usuario(user);
          } else {
            signOut();
            _account.value = null;
            _usuario.value = null;
          }
        } else {
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
    return signInResult;
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
      _account.value = null;
      _usuario.value = null;
      return result;
    } else {
      return false;
    }
  }

  Future<void> _setCurrentAccount() async {
    final stream = await FeaturesAuthPresenter.to.currentAccountGoogle();
    _account.bindStream(stream);
  }

  static AuthController get to => Get.find<AuthController>();
}
