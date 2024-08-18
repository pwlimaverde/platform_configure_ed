import 'dart:async';

import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';
import '../../../utils/typedefs.dart';
import 'get_identificacao/domain/model/get_identificacao_model.dart';
import 'set_identificacao/domain/model/set_identificacao_model.dart';

final class FeaturesLoginPresenter {
  static FeaturesLoginPresenter? _instance;

  final GIUsecase _getIdentificacao;
  final SIUsecase _setIdentificacao;

  FeaturesLoginPresenter._({
    required GIUsecase getIdentificacao,
    required SIUsecase setIdentificacao,
  })  : _getIdentificacao = getIdentificacao,
        _setIdentificacao = setIdentificacao;

  factory FeaturesLoginPresenter({
    required GIUsecase getIdentificacao,
    required SIUsecase setIdentificacao,
  }) {
    _instance ??= FeaturesLoginPresenter._(
      getIdentificacao: getIdentificacao,
      setIdentificacao: setIdentificacao,
    );
    return _instance!;
  }

  Future<String> getIdentificacao() async {
    final data = await _getIdentificacao(NoParams());

    switch (data) {
      case SuccessReturn<GetIdentificacaoModel>():
        return data.result.identificacao;
      case ErrorReturn<GetIdentificacaoModel>():
        return data.result.message;
    }
  }

  Future<bool> setIdentificacao(String apelido) async {
    final data = await _setIdentificacao(
      ParametrosApelido(
        apelido: apelido,
        error: ErrorGeneric(
          message: "Erro ao Gravar Identificação",
        ),
      ),
    );

    switch (data) {
      case SuccessReturn<SetIdentificacaoModel>():
        return true;
      case ErrorReturn<SetIdentificacaoModel>():
        return false;
    }
  }

  static FeaturesLoginPresenter get to => Get.find<FeaturesLoginPresenter>();
}
