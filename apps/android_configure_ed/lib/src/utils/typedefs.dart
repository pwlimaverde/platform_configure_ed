import 'package:dependencies/dependencies.dart';

import '../module/login/features/get_identificacao/domain/model/get_identificacao_model.dart';
import '../module/login/features/set_identificacao/domain/model/set_identificacao_model.dart';

typedef GIUsecase = UsecaseBaseCallData<GetIdentificacaoModel, GetIdentificacaoModel>;
typedef GIData = Datasource<GetIdentificacaoModel>;

typedef SIUsecase = UsecaseBaseCallData<SetIdentificacaoModel, SetIdentificacaoModel>;
typedef SIData = Datasource<SetIdentificacaoModel>;