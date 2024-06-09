import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'features/sign_in/domain/models/usuario.dart';
import 'utils/scopes.dart';

final class AuthController extends GetxController {
  final usuario = Rxn<Usuario>();
  final contactText = ''.obs;
  final currentUser = Rxn<GoogleSignInAccount>(null);
  final isAuthorized = false.obs;

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

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
  );
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

  Future<void> handleAuthorizeScopes() async {
    Logger().d("HandleAuthori ininicio");
    isAuthorized(await _googleSignIn.requestScopes(scopes));
    Logger().d(currentUser.value!.displayName);
    Logger().d(currentUser.value!.email);
    Logger().d(currentUser.value!.id);
    Logger().d("teste id - 115683965301912079872");
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
    _googleSignIn.signOut();
    currentUser.value = null;
    isAuthorized.value = false;
  }
}
