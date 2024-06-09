import 'package:dependencies/dependencies.dart';

import '../utils/typedefs.dart';
import 'nova_conta/domain/model/nova_conta_model.dart';
import 'sign_out/domain/model/sign_out_model.dart';

final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  Usuario? usuario;

  final SigninUsecase _signinUsecase;
  final NovoUserUsecase _novoUserUsecase;
  final SOutUsecase _signOutUsecase;

  FeaturesAuthPresenter._({
    required SigninUsecase signinUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
  })  : _signinUsecase = signinUsecase,
        _signOutUsecase = signOutUsecase,
        _novoUserUsecase = novoUserUsecase;

  factory FeaturesAuthPresenter({
    required SigninUsecase signinUsecase,
    required NovoUserUsecase novoUserUsecase,
    required SOutUsecase signOutUsecase,
  }) {
    _instance ??= FeaturesAuthPresenter._(
        signinUsecase: signinUsecase,
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

  Future<Unit> signIn() async {
    final data = await _signinUsecase(NoParams());
    switch (data) {
      case SuccessReturn<Usuario>():
        usuario = data.result;
        
        return unit;
      case ErrorReturn<Usuario>():
        throw data.result.message;
    }
  }

  Future<Unit> signOut() async {
    final data = await _signOutUsecase(NoParams());
    switch (data) {
      case SuccessReturn<SignOutModel>():
        Logger().d("signOut ok");
        return unit;
      case ErrorReturn<SignOutModel>():
        throw data.result.message;
    }
  }

  static FeaturesAuthPresenter get to => Get.find<FeaturesAuthPresenter>();
}
