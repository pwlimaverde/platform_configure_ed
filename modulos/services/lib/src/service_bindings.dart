import 'package:dependencies_module/dependencies_module.dart';


import 'features/check_connect/datasource/connectivity_datasource.dart';
import 'features/check_connect/domain/usecase/check_connect_usecase.dart';
import 'features/dart_plugin_registrant/datasource/dart_plugin_registrant_datasource.dart';
import 'features/dart_plugin_registrant/domain/usecase/dart_plugin_registrant_usecase.dart';
import 'features/external_ storage/datasource/firebase/firebase_storage_datasource.dart';
import 'features/external_ storage/domain/usecase/external_storage_usecase.dart';
import 'features/features_service_presenter.dart';
import 'features/firebase_init/datasource/firebase_init_datasource.dart';
import 'features/firebase_init/domain/usecase/firebase_init_usecase.dart';
import 'features/local_ storage/datasource/hive_storage_datasource.dart';
import 'features/local_ storage/domain/usecase/local_storage_usecase.dart';
import 'features/permission/datasource/permission_datasource.dart';
import 'features/permission/domain/usecase/permission_usecase.dart';
import 'features/widgets_flutter_binding/datasource/widgets_flutter_binding_datasource.dart';
import 'features/widgets_flutter_binding/domain/usecase/widgets_flutter_binding_usecase.dart';
import 'utils/typedefs.dart';

final class ServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FbServiceData>(
      () => FirebaseInitDatasource(),
    );
    Get.lazyPut<FbService>(
      () => FirebaseInitUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<Connectivity>(
      () => Connectivity(),
    );
    Get.lazyPut<ConnectServiceData>(
      () => ConnectivityDatasource(
        Get.find(),
      ),
    );
    Get.lazyPut<ConnectService>(
      () => CheckConnectUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<WidServiceData>(
      () => WidgetsFlutterBindingDatasource(),
    );
    Get.lazyPut<WidService>(
      () => WidgetsFlutterBindingUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<DtprServiceData>(
      () => DartPluginRegistrantDatasource(),
    );
    Get.lazyPut<DtprService>(
      () => DartPluginRegistrantUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<LsServiceData>(
      () => HiveStorageDatasource(),
    );
    Get.lazyPut<LsService>(
      () => LocalStorageUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<PermissionServiceData>(
      () => PermissionDatasource(),
    );
    Get.lazyPut<PermissionService>(
      () => PermissionUsecase(
        Get.find(),
      ),
    );
    Get.lazyPut<EsServiceData>(
      () => FirebaseStorageDatasource(),
    );
    Get.lazyPut<EsService>(
      () => ExternalStorageUsecase(
        Get.find(),
      ),
    );
    Get.put<FeaturesServicePresenter>(
      FeaturesServicePresenter(
        esService: Get.find(),
        fbService: Get.find(),
        permissionService: Get.find(),
        lsService: Get.find(),
        dtprService: Get.find(),
        widService: Get.find(),
        connectService: Get.find(),
      ),
      permanent: true,
    );
  }
}
