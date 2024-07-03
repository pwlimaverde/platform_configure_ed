import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';
import '../domain/model/remove_usuario_model.dart';

final class RemoveUsuarioDatasource implements Datasource<RemoveUsuarioModel> {
  final ExternalStorage externalStorage;

  RemoveUsuarioDatasource({
    required this.externalStorage,
  });
  @override
  Future<RemoveUsuarioModel> call(ParametrosId parameters) async {
    try {
      final registro = Registro(
        colecao: "user",
        documento: parameters.id,
      );
      await externalStorage.remove(
        registro,
      );
        return RemoveUsuarioModel();
    } catch (e) {
      throw Exception("Erro ao remover o usuario do banco de dados");
    }
  }
}
