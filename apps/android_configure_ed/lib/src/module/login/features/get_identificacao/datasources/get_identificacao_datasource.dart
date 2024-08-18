import 'package:dependencies/dependencies.dart';

import '../domain/model/get_identificacao_model.dart';

final class GetIdentificacaoDatasource
    implements Datasource<GetIdentificacaoModel> {
  final LocalStorage localStorage;

  GetIdentificacaoDatasource({
    required this.localStorage,
  });

  @override
  Future<GetIdentificacaoModel> call(NoParams parameters) async {
    try {
      final identificacao = await FeaturesServicePresenter.to.localStorage
          .read<String>("identificacao");
      return GetIdentificacaoModel(
        identificacao: identificacao,
      );
    } catch (e) {
      await FeaturesServicePresenter.to.localStorage
          .write(key: "identificacao", data: "");
      throw Exception("Erro ao carregar a identificação do dispositivo.");
    }
  }
}
