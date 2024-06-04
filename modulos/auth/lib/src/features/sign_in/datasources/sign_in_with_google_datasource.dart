import 'package:dependencies/dependencies.dart';

import '../domain/models/usuario.dart';

final class SignInWithGoogleDatasource
    implements Datasource<Usuario> {
  final ExternalStorage externalStorage;

  SignInWithGoogleDatasource({required this.externalStorage});
  @override
  Future<Usuario> call(NoParams parameters) async {
    try {
      Logger().e("credenciando");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      Logger().e("credenciado");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Logger().e(result);
      final user = result.user;
      Logger().e(user);

      if (user != null) {
        final registro = Registro(
          colecao: "user",
          documento: user.uid,
        );
        final reference = await externalStorage.read<Map<String, dynamic>>(
          registro,
          false,
        );
        Logger().e(reference);

        return Usuario.fromMap(reference);
      } else {
        throw Exception("Usuario não cadastrado!");
      }
    } catch (e) {
      throw Exception("Erro ao carregar configurações do banco de dados");
    }
  }
}
