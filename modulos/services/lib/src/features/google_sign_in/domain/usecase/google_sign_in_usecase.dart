import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';

///Usecase with external Datasource call
final class GoogleSignInUsecase extends UsecaseBase<GoogleSignIn> {
  final GoogleSignIn signIn;

  GoogleSignInUsecase(this.signIn);

  @override
  Future<ReturnSuccessOrError<GoogleSignIn>> call(NoParams parameters) async {
    return SuccessReturn(
      success: signIn,
    );
  }
}
