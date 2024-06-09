import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

import 'features/sign_in/domain/models/usuario.dart';

final class AuthController extends GetxController {
  final usuario = Rxn<Usuario>();
  final contactText = ''.obs;
  final currentUser = Rxn<GoogleSignInAccount>(null);
  final isAuthorized = false.obs;
  final _googleSignIn = FeaturesServicePresenter.to.signIn;

  @override
  void onInit() {
    super.onInit();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (kIsWeb && account != null) {
        isAuthorized(await _googleSignIn.canAccessScopes(scopes));
      }

      currentUser(account);
    });
    _googleSignIn.signInSilently();
  }

  
  Future<void> handleSignIn() async {
    try {
      Logger().d("Sign ininicio");
      final account = await _googleSignIn.signIn();

      if (kIsWeb && account != null) {
        isAuthorized(await _googleSignIn.canAccessScopes(scopes));
      }

      currentUser(account);
      Logger().d(currentUser.value!.displayName);
      Logger().d(currentUser.value!.email);
      Logger().d(currentUser.value!.id);
      Logger().d("teste id - 115683965301912079872");
      Logger().d("Autorized - $isAuthorized");
    } catch (error) {
      Logger().e(error);
    }
  }


  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
    _googleSignIn.signOut();
    currentUser.value = null;
    isAuthorized.value = false;
  }
}
