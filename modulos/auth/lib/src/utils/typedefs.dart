import 'package:dependencies/dependencies.dart';

import '../features/nova_conta/domain/model/nova_conta_model.dart';
import '../features/sign_out/domain/model/sign_out_model.dart';

typedef SOutUsecase = UsecaseBaseCallData<SignOutModel, SignOutModel>;
typedef SOutData = Datasource<SignOutModel>;

typedef NovoUserUsecase = UsecaseBaseCallData<NovaContaModel, NovaContaModel>;
typedef NovoUserData = Datasource<NovaContaModel>;

typedef SigninGoogleUsecase = UsecaseBaseCallData<GoogleSignInAccount, GoogleSignInAccount>;
typedef SigninGoogleData = Datasource<GoogleSignInAccount>;

typedef GetUserUsecase = UsecaseBaseCallData<Usuario, Map<String, dynamic>>;
typedef GetUserData = Datasource<Map<String, dynamic>>;

typedef CAGoogleUsecase = UsecaseBaseCallData<StCAGoogleData, StCAGoogleData>;
typedef CAGoogleData = Datasource<StCAGoogleData>;
typedef StCAGoogleData = Stream<GoogleSignInAccount?>;


