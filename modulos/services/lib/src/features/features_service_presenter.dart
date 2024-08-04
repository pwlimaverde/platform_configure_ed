import 'package:dependencies/dependencies.dart';

import '../utils/parameters.dart';
import '../utils/typedefs.dart';
import 'check_connect/domain/model/check_connect_model.dart';
import 'local_storage/domain/interface/local_storage.dart';

final class FeaturesServicePresenter {
  static FeaturesServicePresenter? _instance;
  late Stream<CheckConnectModel> checkConnect;
  late LocalStorage localStorage;
  late ExternalStorage externalStorage;
  late GoogleSignIn signIn;

  final PermissionService _permissionService;
  final FbService _fbService;
  final LsService _lsService;
  final EsService _esService;
  final DtprService _dtprService;
  final WidService _widService;
  final ConnectService _connectService;
  final SignInService _signInService;

  FeaturesServicePresenter._({
    required FbService fbService,
    required EsService esService,
    required PermissionService permissionService,
    required LsService lsService,
    required DtprService dtprService,
    required WidService widService,
    required ConnectService connectService,
    required SignInService signInService,
  })  : _connectService = connectService,
        _signInService = signInService,
        _widService = widService,
        _dtprService = dtprService,
        _permissionService = permissionService,
        _esService = esService,
        _fbService = fbService,
        _lsService = lsService;

  factory FeaturesServicePresenter({
    required EsService esService,
    required FbService fbService,
    required PermissionService permissionService,
    required LsService lsService,
    required DtprService dtprService,
    required WidService widService,
    required ConnectService connectService,
    required SignInService signInService,
  }) {
    _instance ??= FeaturesServicePresenter._(
      esService: esService,
      fbService: fbService,
      permissionService: permissionService,
      lsService: lsService,
      dtprService: dtprService,
      widService: widService,
      connectService: connectService,
      signInService: signInService,
    );
    return _instance!;
  }

  Future<Unit> firebaseInitService({required FirebaseOptions options}) async {
    final data = await _fbService(ParametrosFirebaseInit(
        options: options,
        error: ErrorGeneric(
          message: "Erro ao inializar firebase",
        )));
    switch (data) {
      case SuccessReturn<Unit>():
        await _externalStorageService(FirebaseFirestore.instance);
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<void> _externalStorageService(FirebaseFirestore instance) async {
    final data = await _esService(
      ParametrosFirebaseStorage(
        instanceFirebase: instance,
        error: ErrorGeneric(
          message: "Erro  ao carregar instancia do firebase",
        ),
      ),
    );
    switch (data) {
      case SuccessReturn<ExternalStorage>():
        externalStorage = data.result;
      case ErrorReturn<ExternalStorage>():
        throw data.result.message;
    }
  }

  Future<Unit> permissionService() async {
    final data = await _permissionService(NoParams());
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<Unit> localStorageService() async {
    final data = await _lsService(NoParams());
    switch (data) {
      case SuccessReturn<LocalStorage>():
        localStorage = data.result;
        return unit;
      case ErrorReturn<LocalStorage>():
        throw data.result.message;
    }
  }

  Future<Unit> dartPluginRegistrantService() async {
    final data = await _dtprService(NoParams());
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<Unit> widgetsFlutterBindingService() async {
    final data = await _widService(NoParams());
    switch (data) {
      case SuccessReturn<Unit>():
        return unit;
      case ErrorReturn<Unit>():
        throw data.result.message;
    }
  }

  Future<Unit> checkConnectService() async {
    final data = await _connectService(NoParams());
    switch (data) {
      case SuccessReturn<Stream<CheckConnectModel>>():
        checkConnect = data.result;
        return unit;
      case ErrorReturn<Stream<CheckConnectModel>>():
        throw data.result.message;
    }
  }

  Future<Unit> googleSignInService() async {
    final data = await _signInService(NoParams());
    switch (data) {
      case SuccessReturn<GoogleSignIn>():
        signIn = data.result;
        return unit;
      case ErrorReturn<GoogleSignIn>():
        throw data.result.message;
    }
  }

  static FeaturesServicePresenter get to =>
      Get.find<FeaturesServicePresenter>();
}
