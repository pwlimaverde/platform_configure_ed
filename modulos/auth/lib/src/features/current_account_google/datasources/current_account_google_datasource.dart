import 'package:dependencies/dependencies.dart';

import '../../../utils/typedefs.dart';

final class CurrentAccountGoogleDatasource
    implements Datasource<StCAGoogleData> {
  final GoogleSignIn signIn;

  CurrentAccountGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<StCAGoogleData> call(NoParams parameters) async {
    try {
      Logger().f("CurrentAccountGoogleDatasource inicio");
      final account = signIn.onCurrentUserChanged;
      Logger().f("CurrentAccountGoogleDatasource fim");
      return account;
    } catch (e) {
      throw Exception("Erro ao fazer checar a conta google.");
    }
  }
}
