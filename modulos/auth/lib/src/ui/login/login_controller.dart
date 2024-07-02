import 'dart:ui';

import 'package:dependencies/dependencies.dart';

import '../../auth_controller.dart';

class LoginController extends GetxController {
  Future<void> signInGoogleLogin({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      Logger().f("inico signin");
      await AuthController.to.signIn();
      Logger().f("presenter signin");
      final user = AuthController.to.usuario;
      if (user != null) {
        Logger().f("user signin");
        Logger().f(user);
        onSuccess();
      } else {
        onFail();
      }

      // if (user != null) {
      //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      //   var uuid = const Uuid();

      //   final androidInfo = await deviceInfo.androidInfo;
      //   final dispositivo = Dispositivo(
      //     id: uuid.v8(),
      //     nome: "${androidInfo.model} - ${androidInfo.brand}}",
      //     product: androidInfo.product,
      //     model: androidInfo.model,
      //     brand: androidInfo.brand,
      //   );
      //   final licenca = Licenca(
      //     id: uuid.v8(),
      //   );

      //   final comandosMic = ComandosMic(
      //     record: false,
      //     debug: false,
      //     timeStart: 15,
      //   );

      //   final comandosGerais = ComandosGerais(
      //     stopServices: false,
      //   );

      //   Usuario usuario = Usuario(
      //     id: user.uid,
      //     nome: user.displayName,
      //     email: user.email,
      //   );

      //   licenca.dispositivosAtivos.add(dispositivo);

      //   Logger().f(usuario);
      //   Logger().f(licenca);
      //   Logger().f(dispositivo);
      //   final docRef =
      //       FirebaseFirestore.instance.collection("user").doc(usuario.id);
      //   final doc = await docRef.get();

      //   if (!doc.exists) {
      //     var newUser =
      //         FirebaseFirestore.instance.collection("user").doc(usuario.id);

      //     newUser.set(
      //       usuario.toMap(),
      //     );

      //     newUser.collection("licenca").doc(licenca.id).set(licenca.toMap());
      //     newUser
      //         .collection("dispositivos")
      //         .doc(dispositivo.id)
      //         .set(dispositivo.toMap());
      //     newUser
      //         .collection("dispositivos")
      //         .doc(dispositivo.id)
      //         .collection("comandos")
      //         .doc("mic")
      //         .set(
      //           comandosMic.toMap(),
      //         );
      //     newUser
      //         .collection("dispositivos")
      //         .doc(dispositivo.id)
      //         .collection("comandos")
      //         .doc("gerais")
      //         .set(
      //           comandosGerais.toMap(),
      //         );
      //   }
      // }
    } catch (e) {
      onFail();
    }
  }

  Future<void> logOut() async {
    await AuthController.to.signOut();
  }
}
