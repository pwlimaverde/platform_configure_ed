import 'package:dependencies/dependencies.dart';

import '../models/usuario.dart';

final class SignInUsecase extends UsecaseBaseCallData<Usuario, Usuario> {
  SignInUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<Usuario>> call(
      ParametersReturnResult parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
