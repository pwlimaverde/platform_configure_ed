import 'package:dependencies/dependencies.dart';

final class SignInWithGoogleDatasource
    implements Datasource<GoogleSignInAccount> {
  final GoogleSignIn signIn;

  SignInWithGoogleDatasource({
    required this.signIn,
  });
  @override
  Future<GoogleSignInAccount> call(NoParams parameters) async {
    try {
      Logger().d("teste usecase account - inicio");
      final account = await signIn.signIn();
      if (account != null) {
      Logger().d("teste usecase account - $account");
        final checkAccessScopes = await signIn.canAccessScopes(scopes);
      Logger().d("teste usecase scops - $checkAccessScopes");
        if (checkAccessScopes) {
          return account;
        } else {
          final requestAccess = await signIn.requestScopes(scopes);
          if (requestAccess) {
            return account;
          } else {
            throw Exception("Erro ao fazer o login com google. Acesso ao Driver Negado.");
          }
        }
      } else {
        throw Exception("Erro ao fazer o login com google.");
      }
    } catch (e) {
      throw Exception("Erro ao fazer o login com google.");
    }
  }
}

// import 'package:dependencies/dependencies.dart';

// final class SignInWithGoogleDatasource
//     implements Datasource<GoogleSignInAccount> {
//   final GoogleSignIn signIn;

//   SignInWithGoogleDatasource({
//     required this.signIn,
//   });
//   @override
//   Future<GoogleSignInAccount> call(NoParams parameters) async {
//     try {
//       Logger().d("teste usecase account - inicio");
//       final user = await signIn.signIn();
//       final auth = await user?.authentication;
//       final cred = GoogleAuthProvider.credential(
//         accessToken: auth?.accessToken,
//         idToken: auth?.idToken,
//       );
//       final result = await FirebaseAuth.instance.signInWithCredential(cred);
//       final account = result.user;
//       Logger().d("teste usecase account - $account");
//       if (account != null) {
//         final checkAccessScopes = await signIn.canAccessScopes(scopes);
//         if (checkAccessScopes) {
//           return user!;
//         } else {
//           final requestAccess = await signIn.requestScopes(scopes);
//           if (requestAccess) {
//             return user!;
//           } else {
//             throw Exception("Erro ao fazer o login com google. Acesso ao Driver Negado.");
//           }
//         }
//       } else {
//         throw Exception("Erro ao fazer o login com google.");
//       }
//     } catch (e) {
//       throw Exception("Erro ao fazer o login com google.");
//     }
//   }
// }
