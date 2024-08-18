import 'dart:ui';

import 'package:dependencies/dependencies.dart';

import '../../features/features_login_presenter.dart';

class LoginController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await _getIdentificacao();
  }

  final identificacao = "".obs;

  Future<void> _getIdentificacao() async {
    identificacao(
      await FeaturesLoginPresenter.to.getIdentificacao(),
    );
    Logger().f("Identificação $identificacao");
    Logger().f("Identificação ${identificacao.split("-")[0]}");
  }

  Future<void> setIdentificacao(String apelido) async {
    await FeaturesLoginPresenter.to.setIdentificacao(apelido);
    await _getIdentificacao();
  }

  Future<void> signInGoogleLogin({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      if (identificacao.value.isNotEmpty) {
        final result = await AuthController.to.signIn(identificacao.value);

        if (result) {
          onSuccess();
        } else {
          onFail();
        }
      } else {
        onFail();
      }
    } catch (e) {
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
  }

  Future<void> logOut({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    final result = await AuthController.to.signOut();
    if (result) {
      onSuccess();
    } else {
      onFail();
    }
  }

  Future<void> apagarConta({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
    required bool confirmacao,
  }) async {
    final result = await AuthController.to.apagarConta(confirmacao);

    if (result) {
      onSuccess();
    } else {
      onFail();
    }
  }
}
