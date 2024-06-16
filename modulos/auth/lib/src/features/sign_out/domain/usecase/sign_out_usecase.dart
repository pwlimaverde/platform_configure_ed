import 'package:dependencies/dependencies.dart';

import '../model/sign_out_model.dart';

final class SignOutUsecase extends UsecaseBaseCallData<SignOutModel, SignOutModel> {
  SignOutUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<SignOutModel>> call(NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
