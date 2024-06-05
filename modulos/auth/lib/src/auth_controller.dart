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
      isAuthorized(account != null);
      if (kIsWeb && account != null) {
        isAuthorized(await _googleSignIn.canAccessScopes(scopes));
      }

      currentUser(account);

      if (isAuthorized.value) {
        unawaited(handleGetContact(account!));
      }
    });
    _googleSignIn.signInSilently();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: scopes,
  );

  Future<void> handleGetContact(GoogleSignInAccount user) async {
    contactText('Loading contact info...');

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      contactText('People API gave a ${response.statusCode} '
          'response. Check logs for details.');
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
        Logger().d(user.displayName);
        Logger().d(user.email);
        Logger().d(user.id);
        Logger().d("teste id - 115683965301912079872");
    final String? namedContact = _pickFirstNamedContact(data);

    if (namedContact != null) {
      contactText('I see you know $namedContact!');
    } else {
      contactText('No contacts to display.');
    }
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleAuthorizeScopes() async {
    isAuthorized(await _googleSignIn.requestScopes(scopes));

    if (isAuthorized.value) {
      unawaited(handleGetContact(currentUser.value!));
    }
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    }
}
