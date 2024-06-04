import 'dart:async';
import 'package:dependencies/dependencies.dart';
import '../../../../utils/parameters.dart';
import '../../domain/interface/external_storage.dart';
import 'firebase_external_storage.dart';

///Datasources
final class FirebaseStorageDatasource implements Datasource<ExternalStorage> {
  @override
  Future<ExternalStorage> call(
    ParametrosFirebaseStorage parameters,
  ) async {
    try {
      final externalStorage = FirebaseExternalStorage(
        instanceFirebase: parameters.instanceFirebase,
      );
      return externalStorage;
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
