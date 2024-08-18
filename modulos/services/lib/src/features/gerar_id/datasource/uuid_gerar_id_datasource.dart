import 'package:dependencies/dependencies.dart';

import '../domain/interface/gerar_id.dart';

///Datasources
final class UuidGerarIdDatasource implements Datasource<GerarId> {
  @override
  Future<GerarId> call(
    NoParams parameters,
  ) async {
    try {
      final gerarId = UuidGerarId();
      return gerarId;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}

class UuidGerarId implements GerarId {
  @override
  String gerar() {
    var uuid = const Uuid();

    return uuid.v8();
  }
}
