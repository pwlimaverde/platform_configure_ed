import 'package:get/get.dart';

import 'features/sign_in/domain/models/usuario.dart';

final class AuthController extends GetxController {
  final usuario = Rxn<Usuario>();
}
