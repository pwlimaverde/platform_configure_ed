import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

///Datasources
final class WidgetsFlutterBindingDatasource
    implements Datasource<WidgetsBinding> {
  @override
  Future<WidgetsBinding> call(
    NoParams parameters,
  ) async {
    try {
      final widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();
      return widgetsFlutterBinding;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
