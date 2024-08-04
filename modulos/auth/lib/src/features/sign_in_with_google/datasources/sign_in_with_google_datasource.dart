import 'package:dependencies/dependencies.dart';

final class SignInWithGoogleDatasource
    implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();
      if (account != null) {
        final checkAccessScopes = await signIn.canAccessScopes(scopes);
        if (checkAccessScopes) {
          return account;
        } else {
          final requestAccess = await signIn.requestScopes(scopes);
          if (requestAccess) {
            return account;
          } else {
            throw Exception("Erro ao fazer o login com google. Acesso ao Driver Negado.");
          }
        }
      } else {
        throw Exception("Erro ao fazer o login com google.");
      }
    } catch (e) {
      throw Exception("Erro ao fazer o login com google.");
    }
  }
}
