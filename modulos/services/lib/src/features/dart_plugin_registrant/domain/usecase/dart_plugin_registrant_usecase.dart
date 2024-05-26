import 'package:dependencies_module/dependencies_module.dart';

import '../model/dart_plugin_registrant_model.dart';

///Usecase with external Datasource call
final class DartPluginRegistrantUsecase
    extends UsecaseBaseCallData<Unit, DartPluginRegistrantModel> {
  DartPluginRegistrantUsecase(super.datasource);


  @override
  Future<ReturnSuccessOrError<Unit>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<DartPluginRegistrantModel>():
        return SuccessReturn(
          success: unit,
        );
      case ErrorReturn<DartPluginRegistrantModel>():
        return ErrorReturn(
            error: ErrorGeneric(message: "Erro ao iniciar o serviço DartPluginRegistrant"));
    }
  }
}
