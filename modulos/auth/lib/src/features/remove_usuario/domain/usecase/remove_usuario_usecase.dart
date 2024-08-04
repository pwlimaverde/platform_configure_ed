import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';
import '../model/remove_usuario_model.dart';

final class RemoveUsuarioUsecase
    extends UsecaseBaseCallData<RemoveUsuarioModel, RemoveUsuarioModel> {
  RemoveUsuarioUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<RemoveUsuarioModel>> call(ParametrosId parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<RemoveUsuarioModel>():
        return resultDatacource;
      case ErrorReturn<RemoveUsuarioModel>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao remover o usuario do banco de dados",
          ),
        );
    }
  }
}
