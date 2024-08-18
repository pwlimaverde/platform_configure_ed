import 'package:dependencies/dependencies.dart';

import '../module/login/features/get_identificacao/domain/model/get_identificacao_model.dart';

typedef GIUsecase = UsecaseBaseCallData<GetIdentificacaoModel, GetIdentificacaoModel>;
typedef GIData = Datasource<GetIdentificacaoModel>;