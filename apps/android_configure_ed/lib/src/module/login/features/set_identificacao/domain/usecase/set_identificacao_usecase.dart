import 'package:dependencies/dependencies.dart';


import '../../../../../../utils/parameters.dart';
import '../model/set_identificacao_model.dart';

final class SetIdentificacaoUsecase extends UsecaseBaseCallData<SetIdentificacaoModel, SetIdentificacaoModel> {
  SetIdentificacaoUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<SetIdentificacaoModel>> call(ParametrosApelido parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
