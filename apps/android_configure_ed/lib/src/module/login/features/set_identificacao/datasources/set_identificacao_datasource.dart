import 'package:dependencies/dependencies.dart';

import '../../../../../utils/parameters.dart';
import '../domain/model/set_identificacao_model.dart';

final class SetIdentificacaoDatasource
    implements Datasource<SetIdentificacaoModel> {
  final LocalStorage localStorage;
  final GerarId gerarId;

  SetIdentificacaoDatasource({
    required this.localStorage,
    required this.gerarId,
  });

  @override
  Future<SetIdentificacaoModel> call(ParametrosApelido parameters) async {
    try {
      await localStorage
        .write(key: "identificacao", data: "${parameters.apelido}-${gerarId.gerar()}");

      return SetIdentificacaoModel();
    } catch (e) {
      await FeaturesServicePresenter.to.localStorage
          .write(key: "identificacao", data: "");
      throw Exception("Erro ao carregar a identificação do dispositivo.");
    }
  }
}
