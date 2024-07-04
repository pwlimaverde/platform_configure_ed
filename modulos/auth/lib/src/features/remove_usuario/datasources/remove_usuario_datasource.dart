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
      var user = Registro(
        colecao: "user",
        documento: parameters.id,
      );
      final licenca = user.subColecao = Registro(
        colecao: "licenca",
        documento: parameters.id,
      );
      await externalStorage.remove(
        licenca,
      );
      // final dispositivos = user.subColecao = Registro(
      //   colecao: "dispositivos",
      //   documento: parameters.id,
      // );
      // await externalStorage.remove(
      //   dispositivos,
      // );

      user.subColecao = null;
      await externalStorage.remove(
        user,
      );

      return RemoveUsuarioModel();
    } catch (e) {
      throw Exception("Erro ao remover o usuario do banco de dados");
    }
  }
}
