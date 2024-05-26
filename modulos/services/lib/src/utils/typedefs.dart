import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../features/check_connect/domain/model/check_connect_model.dart';
import '../features/dart_plugin_registrant/domain/model/dart_plugin_registrant_model.dart';
import '../features/external_ storage/domain/interface/external_storage.dart';
import '../features/firebase_init/domain/model/dart_plugin_registrant_model.dart';
import '../features/local_ storage/domain/interface/local_storage.dart';
import '../features/permission/domain/model/permission_model.dart';

typedef EsService = UsecaseBaseCallData<ExternalStorage, ExternalStorage>;
typedef EsServiceData = Datasource<ExternalStorage>;

typedef FbService = UsecaseBaseCallData<Unit, FirebaseInitModel>;
typedef FbServiceData = Datasource<FirebaseInitModel>;

typedef PermissionService = UsecaseBaseCallData<Unit, PermissionModel>;
typedef PermissionServiceData = Datasource<PermissionModel>;

typedef LsService = UsecaseBaseCallData<LocalStorage, LocalStorage>;
typedef LsServiceData = Datasource<LocalStorage>;

typedef DtprService = UsecaseBaseCallData<Unit, DartPluginRegistrantModel>;
typedef DtprServiceData = Datasource<DartPluginRegistrantModel>;

typedef WidService = UsecaseBaseCallData<Unit, WidgetsBinding>;
typedef WidServiceData = Datasource<WidgetsBinding>;

typedef ConnectService
    = UsecaseBaseCallData<Stream<CheckConnectModel>, Stream<ConnectStatus>>;
typedef ConnectServiceData = Datasource<Stream<ConnectStatus>>;
typedef ConnectStatus = ({
  bool connect,
  String typeConect,
});
