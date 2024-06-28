import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';
import '../model/nova_conta_model.dart';

final class NovaContaUsecase extends UsecaseBaseCallData<NovaContaModel, NovaContaModel> {
  NovaContaUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<NovaContaModel>> call(ParametrosNovoUser parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
