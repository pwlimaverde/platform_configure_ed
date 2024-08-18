import 'package:dependencies/dependencies.dart';


import '../model/get_identificacao_model.dart';

final class GetIdentificacaoUsecase extends UsecaseBaseCallData<GetIdentificacaoModel, GetIdentificacaoModel> {
  GetIdentificacaoUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<GetIdentificacaoModel>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
