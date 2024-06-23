import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';

final class GetUsuarioDatasource implements Datasource<Map<String, dynamic>> {
  final ExternalStorage externalStorage;

  GetUsuarioDatasource({
    required this.externalStorage,
  });
  @override
  Future<Map<String, dynamic>> call(ParametrosId parameters) async {
    try {
      final registro = Registro(
        colecao: "user",
        documento: parameters.id,
      );
      final reference = await externalStorage.read<Map<String, dynamic>>(
        registro,
        false,
      );
      if (reference.isNotEmpty) {
        return reference;
      } else {
        throw Exception("Usuario não cadastrado!");
      }
    } catch (e) {
      throw Exception("Erro ao carregar usuario do banco de dados");
    }
  }
}
