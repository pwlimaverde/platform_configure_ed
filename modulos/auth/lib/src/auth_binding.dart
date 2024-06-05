import 'package:dependencies/dependencies.dart';
import 'auth_controller.dart';
import 'features/features_auth_presenter.dart';
import 'features/sign_in/datasources/sign_in_with_google_datasource.dart';
import 'features/sign_in/domain/usecase/sign_in_usecase.dart';
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
    Get.lazyPut<SigninData>(
      () => SignInWithGoogleDatasource(
        externalStorage: Get.find(),
      ),
    );
    Get.lazyPut<SigninUsecase>(
      () => SignInUsecase(
        Get.find(),
      ),
    );
    Get.put<FeaturesAuthPresenter>(
      FeaturesAuthPresenter(
        signinUsecase: Get.find(),
      ),
      permanent: true,
    );
  }
}
