import 'dart:async';

import 'package:dependencies/dependencies.dart';

import '../../../utils/typedefs.dart';
import 'get_identificacao/domain/model/get_identificacao_model.dart';

final class FeaturesLoginPresenter {
  static FeaturesLoginPresenter? _instance;

  final GIUsecase _getIdentificacao;

  FeaturesLoginPresenter._({
    required GIUsecase getIdentificacao,
  })  : _getIdentificacao = getIdentificacao;

  factory FeaturesLoginPresenter({
    required GIUsecase getIdentificacao,
  }) {
    _instance ??= FeaturesLoginPresenter._(
        getIdentificacao: getIdentificacao,);
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
  static FeaturesLoginPresenter get to => Get.find<FeaturesLoginPresenter>();
}
