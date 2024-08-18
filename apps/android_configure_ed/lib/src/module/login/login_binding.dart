import 'package:dependencies/dependencies.dart';

import '../../utils/typedefs.dart';
import 'features/features_login_presenter.dart';
import 'features/get_identificacao/datasources/get_identificacao_datasource.dart';
import 'features/get_identificacao/domain/usecase/get_identificacao_usecase.dart';
import 'ui/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<Uuid>(
      () => const Uuid(),
    );
    Get.put<LocalStorage>(
      FeaturesServicePresenter.to.localStorage,
      permanent: true,
    );
    Get.lazyPut<GIData>(
      () => GetIdentificacaoDatasource(
        localStorage: Get.find(),
      ),
    );
    Get.lazyPut<GIData>(
      () => GetIdentificacaoDatasource(
        localStorage: Get.find(),
      ),
    );
    Get.lazyPut<GIUsecase>(
      () => GetIdentificacaoUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<FeaturesLoginPresenter>(
      () => FeaturesLoginPresenter(
        getIdentificacao: Get.find(),
      ),
    );
  }
}
