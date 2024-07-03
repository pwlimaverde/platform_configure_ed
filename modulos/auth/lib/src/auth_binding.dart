import 'package:dependencies/dependencies.dart';
import 'auth_controller.dart';
import 'features/checar_autorizacao_google/datasources/checar_autorizacao_google_datasource.dart';
import 'features/checar_autorizacao_google/domain/usecase/checar_autorizacao_google_usecase.dart';
import 'features/current_account_google/datasources/current_account_google_datasource.dart';
import 'features/current_account_google/domain/usecase/current_account_google_usecase.dart';
import 'features/disconnect_google/datasources/disconnect_google_datasource.dart';
import 'features/disconnect_google/domain/usecase/disconnect_google_usecase.dart';
import 'features/features_auth_presenter.dart';
import 'features/get_usuario/datasources/get_usuario_datasource.dart';
import 'features/get_usuario/domain/usecase/get_usuario_usecase.dart';
import 'features/nova_conta/datasources/nova_conta_datasource.dart';
import 'features/nova_conta/domain/usecase/nova_conta_usecase.dart';
import 'features/remove_usuario/datasources/remove_usuario_datasource.dart';
import 'features/remove_usuario/domain/usecase/remove_usuario_usecase.dart';
import 'features/sign_in_with_google/datasources/sign_in_with_google_datasource.dart';
import 'features/sign_in_with_google/domain/usecase/sign_in_with_google_usecase.dart';
import 'features/sign_out/datasources/sign_out_datasource.dart';
import 'features/sign_out/domain/usecase/sign_out_usecase.dart';
import 'ui/login/login_controller.dart';
import 'utils/typedefs.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
      permanent: true,
    );
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
      () => SignInWithGoogleUsecase(
        Get.find(),
      ),
    );
    Get.put<GoogleSignIn>(
      FeaturesServicePresenter.to.signIn,
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
    Get.lazyPut<CAGoogleData>(
      () => CurrentAccountGoogleDatasource(
        signIn: Get.find(),
      ),
    );
    Get.lazyPut<CAGoogleUsecase>(
      () => CurrentAccountGoogleUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<CkAutGoogleData>(
      () => ChecarAutorizacaoGoogleDatasource(
        signIn: Get.find(),
      ),
    );
    Get.lazyPut<CkAutGoogleUsecase>(
      () => ChecarAutorizacaoGoogleUsecase(
        Get.find(),
      ),
    );

    Get.lazyPut<RemoUserData>(
      () => RemoveUsuarioDatasource(
        externalStorage: Get.find(),
      ),
    );
    Get.lazyPut<RemoUserUsecase>(
      () => RemoveUsuarioUsecase(
        Get.find(),
      ),
    );

    Get.lazyPut<DescGoogleData>(
      () => DisconnectGoogleDatasource(
        Get.find(),
      ),
    );
    Get.lazyPut<DiscGoogleUsecase>(
      () => DisconnectGoogleUsecase(
        Get.find(),
      ),
    );

    Get.put<FeaturesAuthPresenter>(
      FeaturesAuthPresenter(
        remoUserUsecase: Get.find(),
        discGoogleUsecase: Get.find(),
        ckAutGoogleUsecase: Get.find(),
        caGoogleUsecase: Get.find(),
        getUsuarioUsecase: Get.find(),
        signinGoogleUsecase: Get.find(),
        signOutUsecase: Get.find(),
        novoUserUsecase: Get.find(),
      ),
      permanent: true,
    );
  }
}
