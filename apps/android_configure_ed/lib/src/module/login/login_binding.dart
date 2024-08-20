import 'package:dependencies/dependencies.dart';

import '../../utils/typedefs.dart';
import 'features/features_login_presenter.dart';
import 'features/get_identificacao/datasources/get_identificacao_datasource.dart';
import 'features/get_identificacao/domain/usecase/get_identificacao_usecase.dart';
import 'features/set_identificacao/datasources/set_identificacao_datasource.dart';
import 'features/set_identificacao/domain/usecase/set_identificacao_usecase.dart';
import 'ui/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorage>(
      FeaturesServicePresenter.to.localStorage,
      permanent: true,
    );
    Get.put<GerarId>(
      FeaturesServicePresenter.to.gerarId,
      permanent: true,
    );

    Get.put<LoginController>(
      LoginController(),
    );

    Get.lazyPut<SIData>(
      () => SetIdentificacaoDatasource(
        localStorage: Get.find(),
        gerarId: Get.find(),
      ),
    );
    Get.lazyPut<SIUsecase>(
      () => SetIdentificacaoUsecase(
        Get.find(),
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
        setIdentificacao: Get.find(),
      ),
    );
  }
}
