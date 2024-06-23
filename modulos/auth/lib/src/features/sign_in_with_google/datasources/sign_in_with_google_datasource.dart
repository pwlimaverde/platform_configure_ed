import 'package:dependencies/dependencies.dart';

final class SignInWithGoogleDatasource implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();

      if (account != null) {
        return account;
      } else {
        throw Exception("Usuario não cadastrado!");
      }
    } catch (e) {
      throw Exception("Erro ao carregar configurações do banco de dados");
    }
  }
}
