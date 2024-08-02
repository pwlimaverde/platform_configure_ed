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
      final user = Registro(
        colecao: "user",
        documento: parameters.id,
      );

      final registroLicenca = user.copyWith(
        subColecao: Registro(
          colecao: "licenca",
          documento: parameters.id,
        ),
      );

      await externalStorage.remove(
        registroLicenca,
      );

      final listDispositivosData = await externalStorage.readCollection(
        user,
        "dispositivos",
      );

      if (listDispositivosData.isNotEmpty) {
        final listDispositivos =
            listDispositivosData.map((e) => Dispositivo.fromMap(e)).toList();

        for (Dispositivo dispositivo in listDispositivos) {
          final registroDispositivo = user.copyWith(
            subColecao: Registro(
              colecao: "dispositivos",
              documento: dispositivo.id,
            ),
          );

          await externalStorage.remove(
            registroDispositivo,
          );
        }
      }

      await externalStorage.remove(
        user,
      );

      return RemoveUsuarioModel();
    } catch (e) {
      throw Exception("Erro ao remover o usuario do banco de dados");
    }
  }
}
