import 'package:dependencies/dependencies.dart';

import '../interface/gerar_id.dart';
final class GerarIdUsecase
    extends UsecaseBaseCallData<GerarId, GerarId> {
  GerarIdUsecase(super.datasource);


  @override
  Future<ReturnSuccessOrError<GerarId>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
