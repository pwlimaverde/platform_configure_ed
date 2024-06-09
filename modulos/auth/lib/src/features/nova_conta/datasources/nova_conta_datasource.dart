import 'package:dependencies/dependencies.dart';

import '../domain/model/nova_conta_model.dart';

final class NovaContaDatasource implements Datasource<NovaContaModel> {
  final GoogleSignIn signIn;
  final List<String> scopes;
  final ExternalStorage externalStorage;

  NovaContaDatasource({
    required this.signIn,
    required this.scopes,
    required this.externalStorage,
  });

  @override
  Future<NovaContaModel> call(NoParams parameters) async {
    try {
      final account = await signIn.signIn();
      if (account != null) {
        final isNewUser = await externalStorage.read<Map<String, dynamic>>(
          Registro(colecao: "user", documento: account.id),
          false,
        );
        if (isNewUser.isEmpty) {
          await signIn.requestScopes(scopes);
          var uuid = const Uuid();

          final licenca = Licenca(
            id: uuid.v8(),
          );

          await externalStorage.write(
            Registro(
              colecao: "user",
              documento: account.id,
              dados: {
                "nome": account.displayName,
                "email": account.email,
                "id": account.id,
              },
              subColecao: Registro(
                colecao: "licenca",
                documento: licenca.id,
                dados: licenca.toMap(),
              ),
            ),
          );
          return NovaContaModel();
        } else {
          signIn.disconnect();
          signIn.signOut();
          throw Exception("Usuario já cadastrado.");
        }
      } else {
        signIn.disconnect();
        signIn.signOut();
        throw Exception("Erro ao criar a nova conta.");
      }
    } catch (e) {
      signIn.disconnect();
      signIn.signOut();
      throw Exception("Erro ao criar a nova conta.");
    }
  }
}
