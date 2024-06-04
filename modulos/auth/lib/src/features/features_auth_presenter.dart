import 'package:dependencies/dependencies.dart';

import '../utils/typedefs.dart';
import 'sign_in/domain/models/usuario.dart';
final class FeaturesAuthPresenter {
  static FeaturesAuthPresenter? _instance;

  Usuario? usuario;

  final SigninUsecase _signinUsecase;

  FeaturesAuthPresenter._({
    required SigninUsecase signinUsecase,
  })  : _signinUsecase = signinUsecase;

  factory FeaturesAuthPresenter({
    required SigninUsecase signinUsecase,
  }) {
    _instance ??= FeaturesAuthPresenter._(
      signinUsecase: signinUsecase,
    );
    return _instance!;
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

  static FeaturesAuthPresenter get to =>
      Get.find<FeaturesAuthPresenter>();
}
