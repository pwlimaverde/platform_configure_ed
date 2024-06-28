import 'package:dependencies/dependencies.dart';
import 'auth_controller.dart';
import 'features/features_auth_presenter.dart';
import 'features/get_usuario/datasources/get_usuario_datasource.dart';
import 'features/get_usuario/domain/usecase/get_usuario_usecase.dart';
import 'features/nova_conta/datasources/nova_conta_datasource.dart';
import 'features/nova_conta/domain/usecase/nova_conta_usecase.dart';
import 'features/sign_in_with_google/datasources/sign_in_with_google_datasource.dart';
import 'features/sign_in_with_google/domain/usecase/sign_in_with_google_usecase.dart';
import 'features/sign_out/datasources/sign_out_datasource.dart';
import 'features/sign_out/domain/usecase/sign_out_usecase.dart';
import 'utils/typedefs.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );
    Get.put<ExternalStorage>(
      FeaturesServicePresenter.to.externalStorage,
      permanent: true,
    );

    Get.lazyPut<GetUserData>(
      () => GetUsuarioDatasource(
        externalStorage: Get.find(),
      ),
    );
    Get.lazyPut<GetUserUsecase>(
      () => GetUsuarioUsecase(
        Get.find(),
      ),
    );

    Get.lazyPut<SigninGoogleData>(
      () => SignInWithGoogleDatasource(
        signIn: Get.find(),
      ),
    );
    Get.lazyPut<SigninGoogleUsecase>(
      () => SignInWithGooleUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<GoogleSignIn>(
      () => FeaturesServicePresenter.to.signIn,
    );
    Get.lazyPut<Uuid>(
      () => const Uuid(),
    );
    Get.lazyPut<NovoUserData>(
      () => NovaContaDatasource(
        uuid: Get.find(),
        scopes: scopes,
        externalStorage: Get.find(),
      ),
    );
    Get.lazyPut<NovoUserUsecase>(
      () => NovaContaUsecase(
        Get.find(),
      ),
    );

    Get.lazyPut<SOutData>(
      () => SignOutDatasource(
        Get.find(),
      ),
    );
    Get.lazyPut<SOutUsecase>(
      () => SignOutUsecase(
        Get.find(),
      ),
    );
    Get.put<FeaturesAuthPresenter>(
      FeaturesAuthPresenter(
        getUsuarioUsecase: Get.find(),
        signinGoogleUsecase: Get.find(),
        signOutUsecase: Get.find(),
        novoUserUsecase: Get.find(),
      ),
      permanent: true,
    );
  }
}
