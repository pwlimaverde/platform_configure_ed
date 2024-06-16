import 'package:dependencies/dependencies.dart';

final class SignInWithGoogleDatasource implements Datasource<Usuario> {
  final ExternalStorage externalStorage;
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.externalStorage,
    required this.signIn,
  });
  @override
  Future<Usuario> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();

      if (account != null) {
        final registro = Registro(
          colecao: "user",
          documento: account.id,
        );
        final reference = await externalStorage.read<Map<String, dynamic>>(
          registro,
          false,
        );
        if (reference.isNotEmpty) {
          return Usuario.fromMap(reference);
        } else {
          signIn.disconnect();
          signIn.signOut();
          throw Exception("Usuario não cadastrado!");
        }
      } else {
        signIn.disconnect();
        signIn.signOut();
        throw Exception("Usuario não cadastrado!");
      }
    } catch (e) {
      signIn.disconnect();
      signIn.signOut();
      throw Exception("Erro ao carregar configurações do banco de dados");
    }
  }
}
