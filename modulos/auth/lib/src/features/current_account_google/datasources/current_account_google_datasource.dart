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
      signIn.signInSilently();
      return signIn.onCurrentUserChanged;
    } catch (e) {
      throw Exception("Erro ao fazer checar a conta google.");
    }
  }
}
