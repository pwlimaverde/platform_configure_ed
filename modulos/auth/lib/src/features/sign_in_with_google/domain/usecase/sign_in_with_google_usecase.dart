import 'package:dependencies/dependencies.dart';
final class SignInWithGooleUsecase extends UsecaseBaseCallData<GoogleSignInAccount, GoogleSignInAccount> {
  SignInWithGooleUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<GoogleSignInAccount>> call(
      ParametersReturnResult parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    return resultDatacource;
  }
}
