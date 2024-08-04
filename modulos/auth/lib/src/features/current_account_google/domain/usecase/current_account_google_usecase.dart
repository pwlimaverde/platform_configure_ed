import 'package:dependencies/dependencies.dart';

import '../../../../utils/typedefs.dart';
final class CurrentAccountGoogleUsecase extends UsecaseBaseCallData<StCAGoogleData, StCAGoogleData> {
  CurrentAccountGoogleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<StCAGoogleData>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
