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
    try {
      final checkAccessScopes = await signIn.canAccessScopes(scopes);
      if (checkAccessScopes) {
        return ChecarAutorizacaoGoogleModel();
      } else {
        final requestAccess = await signIn.requestScopes(scopes);
        if (requestAccess) {
          return ChecarAutorizacaoGoogleModel();
        } else {
          throw Exception(
            "Acesso ao Driver Negado.",
          );
        }
      }
    } catch (e) {
      throw Exception("Erro ao checar a conta google.");
    }
  }
}
