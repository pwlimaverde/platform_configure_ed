import 'package:dependencies/dependencies.dart';

final class SignInWithGoogleDatasource
    implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    throw Exception("Erro ao fazer o login com google.");
  }
}
