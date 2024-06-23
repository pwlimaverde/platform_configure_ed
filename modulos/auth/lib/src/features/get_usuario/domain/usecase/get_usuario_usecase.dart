import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';

final class GetUsuarioUsecase
    extends UsecaseBaseCallData<Usuario, Map<String, dynamic>> {
  GetUsuarioUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<Usuario>> call(ParametrosId parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<Map<String, dynamic>>():
        final usuario = Usuario.fromMap(resultDatacource.result);
        return SuccessReturn(success: usuario);
      case ErrorReturn<Map<String, dynamic>>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao carregar usuario do banco de dados",
          ),
        );
    }
  }
}
