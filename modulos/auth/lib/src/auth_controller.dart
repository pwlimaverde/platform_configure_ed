import 'dart:async';

import 'package:dependencies/dependencies.dart';

import 'features/features_auth_presenter.dart';

final class AuthController extends GetxController {
  final GoogleSignIn _signIn;

  AuthController({
    required GoogleSignIn googleSignIn,
  }) : _signIn = googleSignIn;

  final _usuario = Rxn<Usuario>();
  Usuario? get usuario => _usuario.value;

  final _account = Rxn<GoogleSignInAccount>();
  GoogleSignInAccount? get account => _account.value;

  final _account2 = Rxn<GoogleSignInAccount>();
  GoogleSignInAccount? get account2 => _account.value;

  @override
  void onInit() {
    super.onInit();
    _setCurrentAccount();
    // _signIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
    //   if (account != null) {
    //     final user = await FeaturesAuthPresenter.to.getUsuario(account.id);
    //     final access = await _signIn.requestScopes(scopes);
    //     if (user != null && access == true) {
    //       _account(account);
    //       _usuario(user);
    //     } else {
    //       signOut();
    //       _account.value = null;
    //       _usuario.value = null;
    //     }
    //   }
    // });
    // _signIn.signInSilently();

    _account2.listen((data){
      Logger().f("account2 teste");
      Logger().f(data);
    });
  }

  Future<void> signIn() async {
    if (usuario != null && account != null) {
      return;
    }
    final signInResult = await FeaturesAuthPresenter.to.signIn();
    if (signInResult != null) {
      _usuario(signInResult.user);
      _account(signInResult.account);
    }
  }

  Future<void> signOut() async {
    final result = await FeaturesAuthPresenter.to.signOut();
    Logger().f("logout");
    Logger().f(result);
    if (result) {
      _usuario.value = null;
      _account.value = null;
      Logger().f("user logout");
      Logger().f(_usuario);
    }
  }

Future<void> _setCurrentAccount() async{
  _account2.bindStream(await FeaturesAuthPresenter.to.currentAccountGoogle());
}
  static AuthController get to => Get.find<AuthController>();
}

