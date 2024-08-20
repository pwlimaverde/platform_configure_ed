import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';
import '../model/get_dispositivo_model.dart';

final class GetDispositivoUsecase
    extends UsecaseBaseCallData<Dispositivo, GetDispositivoModel> {
  GetDispositivoUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<Dispositivo>> call(
      ParametrosDispositivoId parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<GetDispositivoModel>():
        final dispositivo = Dispositivo.fromMap(resultDatacource.result.data);

        return SuccessReturn(success: dispositivo);
      case ErrorReturn<GetDispositivoModel>():
        return ErrorReturn(
          error: resultDatacource.result,
        );
    }
  }
}
