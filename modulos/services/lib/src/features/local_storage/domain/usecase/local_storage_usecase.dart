import 'package:dependencies/dependencies.dart';
import '../interface/local_storage.dart';

final class LocalStorageUsecase extends UsecaseBaseCallData<
    LocalStorage, LocalStorage> {
  LocalStorageUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<LocalStorage>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<LocalStorage>():
        final result = resultDatacource.result;
        return SuccessReturn(
          success: result,
        );

      case ErrorReturn<LocalStorage>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao iniciar o serviço LocalStorage",
          ),
        );
    }
  }
}
