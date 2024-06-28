import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';
import '../domain/model/nova_conta_model.dart';

final class NovaContaDatasource implements Datasource<NovaContaModel> {
  final Uuid uuid;
  final List<String> scopes;
  final ExternalStorage externalStorage;

  NovaContaDatasource({
    required this.uuid,
    required this.scopes,
    required this.externalStorage,
  });

  @override
  Future<NovaContaModel> call(ParametrosNovoUser parameters) async {
    try {
          final licenca = Licenca(
            id: uuid.v8(),
          );
          await externalStorage.write(
            Registro(
              colecao: "user",
              documento: parameters.id,
              dados: {
                "nome": parameters.nome,
                "email": parameters.email,
                "id": parameters.id,
              },
              subColecao: Registro(
                colecao: "licenca",
                documento: licenca.id,
                dados: licenca.toMap(),
              ),
            ),
          );
          return NovaContaModel();
        
    } catch (e) {
      throw Exception("Erro ao criar a nova conta.");
    }
  }
}
