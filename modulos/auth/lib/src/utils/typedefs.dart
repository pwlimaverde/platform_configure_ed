import 'package:dependencies/dependencies.dart';

import '../features/sign_in/domain/models/usuario.dart';

typedef SigninUsecase = UsecaseBaseCallData<Usuario, Usuario>;
typedef SigninData = Datasource<Usuario>;

