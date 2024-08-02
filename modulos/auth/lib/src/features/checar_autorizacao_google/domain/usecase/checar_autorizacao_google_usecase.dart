import 'package:dependencies/dependencies.dart';
import '../model/checar_autorizacao_google_model.dart';

final class ChecarAutorizacaoGoogleUsecase extends UsecaseBaseCallData<
    ChecarAutorizacaoGoogleModel, ChecarAutorizacaoGoogleModel> {
  ChecarAutorizacaoGoogleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<ChecarAutorizacaoGoogleModel>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
