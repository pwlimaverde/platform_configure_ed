import 'package:dependencies/dependencies.dart';

final class AuthController extends GetxController {
  final usuario = Rxn<Usuario>();
  final isAuthorized = false.obs;
  final _googleSignIn = FeaturesServicePresenter.to.signIn;

  // @override
  // void onInit() {
  //   super.onInit();
  //   _googleSignIn.onCurrentUserChanged
  //       .listen((GoogleSignInAccount? account) async {
  //     if (account != null) {
  //       final registro = Registro(
  //         colecao: "user",
  //         documento: account.id,
  //       );
  //       final reference = await FeaturesServicePresenter.to.externalStorage
  //           .read<Map<String, dynamic>>(
  //         registro,
  //         false,
  //       );
  //       if (reference.isNotEmpty) {
  //         isAuthorized(await _googleSignIn.canAccessScopes(scopes));
  //       } else {
  //         FeaturesServicePresenter.to.signIn.disconnect();
  //         FeaturesServicePresenter.to.signIn.signOut();
  //       }
  //     }
  //   });
  //   _googleSignIn.signInSilently();
  // }
}
