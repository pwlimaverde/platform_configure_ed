import 'package:dependencies/dependencies.dart';

import '../../../utils/parameters.dart';
import '../domain/model/novo_dispositivo_model.dart';

final class NovoDispositivoDatasource
    implements Datasource<NovoDispositivoModel> {
  final DeviceInfoPlugin deviceInfo;
  final ExternalStorage externalStorage;

  NovoDispositivoDatasource({
    required this.deviceInfo,
    required this.externalStorage,
  });

  @override
  Future<NovoDispositivoModel> call(ParametrosNovoDispositivo parameters) async {
    try {
      Logger().d("teste dispositivo account - inicio");
      final userRegistro = Registro(
        colecao: "user",
        documento: parameters.id,
      );

      final androidInfo = await deviceInfo.androidInfo;

      final dispositivo = Dispositivo(
        id: parameters.identificacao,
        nome: "${androidInfo.model} - ${androidInfo.brand}}",
        product: androidInfo.product,
        model: androidInfo.model,
        brand: androidInfo.brand,
      );


      final comandosGerais = ComandosGerais(
        stopServices: false,
      );

      final dispositivoRegistro = userRegistro.copyWith(
        subColecao: Registro(
          colecao: "dispositivos",
          documento: dispositivo.id,
          dados: dispositivo.toMap(),
          subColecao: Registro(
            colecao: "comandos",
            documento: "gerais",
            dados: comandosGerais.toMap(),
          ),
        ),
      );

      await externalStorage.write(dispositivoRegistro);

      final comandosMic = ComandosMic(
        record: false,
        debug: false,
        timeStart: 10,
      );

      final comandosMicRegistro = userRegistro.copyWith(
        subColecao: Registro(
          colecao: "dispositivos",
          documento: dispositivo.id,
          subColecao: Registro(
            colecao: "comandos",
            documento: "mic",
            dados: comandosMic.toMap(),
          ),
        ),
      );

      await externalStorage.write(comandosMicRegistro);

      final docRef = await externalStorage.readDocument(Registro(
        colecao: "user",
        documento: parameters.id,
      ));

      Logger().f(docRef);
      Logger().f(dispositivo);

      return NovoDispositivoModel();
    } catch (e) {
      throw Exception("Erro ao criar a nova conta.");
    }
  }
}
