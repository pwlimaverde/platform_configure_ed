import 'package:dependencies/dependencies.dart';

import '../../domain/model/checar_autorizacao_google_model.dart';

final class ChecarAutorizacaoGoogleDatasource
    implements Datasource<ChecarAutorizacaoGoogleModel> {
  final GoogleSignIn signIn;

  ChecarAutorizacaoGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<ChecarAutorizacaoGoogleModel> call(NoParams parameters) async {
    throw Exception("Erro ao checar a conta google.");
  }
}
