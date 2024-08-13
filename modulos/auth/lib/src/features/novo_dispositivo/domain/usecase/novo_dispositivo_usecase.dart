import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';
import '../model/novo_dispositivo_model.dart';

final class NovoDispositivoUsecase extends UsecaseBaseCallData<NovoDispositivoModel, NovoDispositivoModel> {
  NovoDispositivoUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<NovoDispositivoModel>> call(ParametrosId parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
