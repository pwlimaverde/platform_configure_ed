import 'package:dependencies_module/dependencies_module.dart';

import '../domain/model/permission_model.dart';

///Datasources
final class PermissionDatasource implements Datasource<PermissionModel> {
  @override
  Future<PermissionModel> call(
    NoParams parameters,
  ) async {
    try {
      await Permission.ignoreBatteryOptimizations.isDenied.then((value) {
        if (value) {
          AndroidPowerManager.requestIgnoreBatteryOptimizations();
        }
      });
      await Permission.microphone.isDenied.then((value) {
        if (value) {
          Permission.microphone.request();
        }
      });
      await Permission.systemAlertWindow.isDenied.then((value) {
        if (value) {
          Permission.systemAlertWindow.request();
        }
      });
      await Permission.camera.isDenied.then((value) {
        if (value) {
          Permission.camera.request();
        }
      });
      return PermissionModel();
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
