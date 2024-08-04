import 'package:dependencies/dependencies.dart';
final class SignInWithGoogleUsecase extends UsecaseBaseCallData<GoogleSignInAccount, GoogleSignInAccount> {
  SignInWithGoogleUsecase(super.datasource);

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
