import 'package:dependencies/dependencies.dart';

import '../domain/model/disconnect_google_model.dart';

final class DisconnectGoogleDatasource implements Datasource<DisconnectGoogleModel> {
  final GoogleSignIn signIn;

  DisconnectGoogleDatasource(
    this.signIn,
  );

  @override
  Future<DisconnectGoogleModel> call(NoParams parameters) async {
    try {
      signIn.disconnect();
      return DisconnectGoogleModel();
    } catch (e) {
      throw Exception("Erro ao remover a conta google.");
    }
  }
}
