import 'dart:ui';
import 'package:dependencies_module/dependencies_module.dart';

import '../domain/model/dart_plugin_registrant_model.dart';

///Datasources
final class DartPluginRegistrantDatasource
    implements Datasource<DartPluginRegistrantModel> {
  @override
  Future<DartPluginRegistrantModel> call(
    NoParams parameters,
  ) async {
    try {
      DartPluginRegistrant.ensureInitialized();
      return DartPluginRegistrantModel();
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
