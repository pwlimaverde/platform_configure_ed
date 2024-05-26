import 'package:dependencies_module/dependencies_module.dart';
import '../model/permission_model.dart';

///Usecase with external Datasource call
final class PermissionUsecase
    extends UsecaseBaseCallData<Unit, PermissionModel> {
  PermissionUsecase(super.datasource);


  @override
  Future<ReturnSuccessOrError<Unit>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<PermissionModel>():
        return SuccessReturn(
          success: unit,
        );
      case ErrorReturn<PermissionModel>():
        return ErrorReturn(
            error: ErrorGeneric(message: "Erro ao iniciar o serviço Permission"));
    }
  }
}
