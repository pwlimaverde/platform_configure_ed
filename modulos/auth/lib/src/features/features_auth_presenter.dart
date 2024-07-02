import 'dart:async';

import 'package:dependencies/dependencies.dart';

import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'checar_autorizacao_google/domain/model/checar_autorizacao_google_model.dart';
import 'nova_conta/domain/model/nova_conta_model.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  final SigninGoogleUsecase _signinGoogleUsecase;
  final NovoUserUsecase _novoUserUsecase;
  final SOutUsecase _signOutUsecase;
  final GetUserUsecase _getUsuarioUsecase;
  final CAGoogleUsecase _caGoogleUsecase;
  final CkAutGoogleUsecase _ckAutGoogleUsecase;

  FeaturesAuthPresenter._({
    required CkAutGoogleUsecase ckAutGoogleUsecase,
    required CAGoogleUsecase caGoogleUsecase,
    required SigninGoogleUsecase signinGoogleUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
    required GetUserUsecase getUsuarioUsecase,
  })  : _signinGoogleUsecase = signinGoogleUsecase,
        _signOutUsecase = signOutUsecase,
        _getUsuarioUsecase = getUsuarioUsecase,
        _caGoogleUsecase = caGoogleUsecase,
        _ckAutGoogleUsecase = ckAutGoogleUsecase,
        _novoUserUsecase = novoUserUsecase;

  factory FeaturesAuthPresenter({
    required CkAutGoogleUsecase ckAutGoogleUsecase,
    required CAGoogleUsecase caGoogleUsecase,
    required SigninGoogleUsecase signinGoogleUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
    required GetUserUsecase getUsuarioUsecase,
  }) {
    _instance ??= FeaturesAuthPresenter._(
        ckAutGoogleUsecase: ckAutGoogleUsecase,
        getUsuarioUsecase: getUsuarioUsecase,
        signinGoogleUsecase: signinGoogleUsecase,
        novoUserUsecase: novoUserUsecase,
        caGoogleUsecase: caGoogleUsecase,
        signOutUsecase: signOutUsecase);
    return _instance!;
  }

  Future<bool> _novaConta(GoogleSignInAccount account) async {
    final data = await _novoUserUsecase(
      ParametrosNovoUser(
        id: account.id,
        nome: account.displayName ?? "",
        email: account.email,
        error: ErrorGeneric(
          message: "Erro ao criar novo usuario",
        ),
      ),
    );
    switch (data) {
      case SuccessReturn<NovaContaModel>():
        return true;
      case ErrorReturn<NovaContaModel>():
        return false;
    }
  }

  Future<GoogleSignInAccount?> _signInGoogle() async {
    final data = await _signinGoogleUsecase(NoParams());
    switch (data) {
      case SuccessReturn<GoogleSignInAccount>():
        return data.result;
      case ErrorReturn<GoogleSignInAccount>():
        return null;
    }
  }

  Future<Usuario?> getUsuario(String id) async {
    final resultGetUser = await _getUsuarioUsecase(
      ParametrosId(
        id: id,
        error: ErrorGeneric(
          message: "Erro ao fazer login",
        ),
      ),
    );

    switch (resultGetUser) {
      case SuccessReturn<Usuario>():
        return resultGetUser.result;
      case ErrorReturn<Usuario>():
        return null;
    }
  }

  Future<({GoogleSignInAccount account, Usuario user})?> signIn() async {
    try {
      final account = await _signInGoogle();
      if (account != null) {
        final user = await getUsuario(account.id);
        if (user != null) {
          return (account: account, user: user);
        } else {
          final resultNovoUser = await _novaConta(account);
          final user = await getUsuario(account.id);
          if (resultNovoUser && user != null) {
            return (account: account, user: user);
          } else {
            signOut();
            return null;
          }
        }
      } else {
        signOut();
        return null;
      }
    } catch (e) {
      signOut();
      return null;
    }
  }

  Future<bool> signOut() async {
    final data = await _signOutUsecase(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        return true;
      case ErrorReturn<SignOutModel>():
        return false;
    }
  }

  Future<StCAGoogleData> currentAccountGoogle() async {
    final data = await _caGoogleUsecase(NoParams());
    switch (data) {
      case SuccessReturn<StCAGoogleData>():
        return data.result;
      case ErrorReturn<StCAGoogleData>():
        throw Exception("Erro ao fazer checar a conta google.");
    }
  }

  Future<bool> checarAutorizacaoGoogle() async {
    final data = await _ckAutGoogleUsecase(NoParams());
    switch (data) {
      case SuccessReturn<ChecarAutorizacaoGoogleModel>():
        return true;
      case ErrorReturn<ChecarAutorizacaoGoogleModel>():
        return false;
    }
  }

  static FeaturesAuthPresenter get to => Get.find<FeaturesAuthPresenter>();
}
