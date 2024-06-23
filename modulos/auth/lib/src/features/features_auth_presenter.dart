import 'package:dependencies/dependencies.dart';

import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'nova_conta/domain/model/nova_conta_model.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  Usuario? usuario;
  GoogleSignInAccount? account;

  final SigninGoogleUsecase _signinGoogleUsecase;
  final NovoUserUsecase _novoUserUsecase;
  final SOutUsecase _signOutUsecase;
  final GetUserUsecase _getUsuarioUsecase;

  FeaturesAuthPresenter._({
    required SigninGoogleUsecase signinGoogleUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
    required GetUserUsecase getUsuarioUsecase,
  })  : _signinGoogleUsecase = signinGoogleUsecase,
        _signOutUsecase = signOutUsecase,
        _getUsuarioUsecase = getUsuarioUsecase,
        _novoUserUsecase = novoUserUsecase;

  factory FeaturesAuthPresenter({
    required SigninGoogleUsecase signinGoogleUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
    required GetUserUsecase getUsuarioUsecase,
  }) {
    _instance ??= FeaturesAuthPresenter._(
        getUsuarioUsecase: getUsuarioUsecase,
        signinGoogleUsecase: signinGoogleUsecase,
        novoUserUsecase: novoUserUsecase,
        signOutUsecase: signOutUsecase);
    return _instance!;
  }

  Future<Unit> novaConta() async {
    final data = await _novoUserUsecase(NoParams());
    switch (data) {
      case SuccessReturn<NovaContaModel>():
        Logger().d("novaConta ok");
        return unit;
      case ErrorReturn<NovaContaModel>():
        throw data.result.message;
    }
  }

  Future<Unit> _signInGoogle() async {
    final data = await _signinGoogleUsecase(NoParams());
    switch (data) {
      case SuccessReturn<GoogleSignInAccount>():
        account = data.result;
        return unit;
      case ErrorReturn<GoogleSignInAccount>():
        throw data.result.message;
    }
  }

  Future<Unit> signIn() async {
    if (account != null && usuario != null) {
      return unit;
    } else {
      await _signInGoogle();
      if (account != null) {
        final result = await _getUsuarioUsecase(
          ParametrosId(
            id: account!.id,
            error: ErrorGeneric(
              message: "Erro ao fazer login",
            ),
          ),
        );
        switch (result) {
          case SuccessReturn<Usuario>():
            usuario = result.result;
            Logger().d("usuario ${usuario!.id}");
            return unit;
          case ErrorReturn<Usuario>():
            await signOut();
            Logger().d("usuario não cadastrado");
            throw result.result.message;
        }
      }
      return unit;
    }
  }

  Future<Unit> signOut() async {
    final data = await _signOutUsecase(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        Logger().d("signOut ok");
        usuario = null;
        account = null;
        return unit;
      case ErrorReturn<SignOutModel>():
        throw data.result.message;
    }
  }

  static FeaturesAuthPresenter get to => Get.find<FeaturesAuthPresenter>();
}
