import 'package:dependencies/dependencies.dart';

import '../domain/model/sign_out_model.dart';

final class SignOutDatasource implements Datasource<SignOutModel> {
  final GoogleSignIn signIn;

  SignOutDatasource(
    this.signIn,
  );

  @override
  Future<SignOutModel> call(NoParams parameters) async {
    try {
      signIn.disconnect();
      signIn.signOut();
      return SignOutModel();
    } catch (e) {
      throw Exception("Erro ao fazer o logout.");
    }
  }
}
