import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';
import '../domain/model/get_dispositivo_model.dart';

final class GetDispositivoDatasource
    implements Datasource<GetDispositivoModel> {
  final ExternalStorage externalStorage;

  GetDispositivoDatasource({
    required this.externalStorage,
  });
  @override
  Future<GetDispositivoModel> call(ParametrosDispositivoId parameters) async {
    try {
      final registro = Registro(
          colecao: "user",
          documento: parameters.idUser,
          subColecao: Registro(
            colecao: "dispositivos",
            documento: parameters.idDispositivo,
          ));

      final reference = await externalStorage.readDocument(
        registro,
      );
      if (reference.isNotEmpty) {
        return GetDispositivoModel(data: reference);
      } else {
        throw Exception("Dispositivo não localizado!");
      }
    } catch (e) {
      throw Exception("Erro ao carregar dispositivo do banco de dados");
    }
  }
}
