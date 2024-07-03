import 'package:dependencies/dependencies.dart';

import '../model/disconnect_google_model.dart';

final class DisconnectGoogleUsecase
    extends UsecaseBaseCallData<DisconnectGoogleModel, DisconnectGoogleModel> {
  DisconnectGoogleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<DisconnectGoogleModel>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
