import 'package:dependencies_module/dependencies_module.dart';

import '../../../../utils/typedefs.dart';
import '../model/check_connect_model.dart';

final class CheckConnectUsecase extends UsecaseBaseCallData<
    Stream<CheckConnectModel>, Stream<ConnectStatus>> {
  CheckConnectUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<Stream<CheckConnectModel>>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<Stream<ConnectStatus>>():
        final conn = resultDatacource.result.map((event) => CheckConnectModel(
              connect: event.connect,
              typeConect: event.typeConect,
            ));
        return SuccessReturn(
          success: conn,
        );

      case ErrorReturn<Stream<ConnectStatus>>():
        return ErrorReturn(
          error: ErrorGeneric(
            message: "Erro ao iniciar o serviço CheckConnect",
          ),
        );
    }
  }
}
