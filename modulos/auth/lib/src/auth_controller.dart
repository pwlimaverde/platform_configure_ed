import 'package:get/get.dart';

import 'features/signIn/domain/models/usuario.dart';

final class AuthController extends GetxController {
  final usuario = Rxn<Usuario>();
}
