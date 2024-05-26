import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../../features/signIn/domain/models/comandos_gerais.dart';
import '../../features/signIn/domain/models/comandos_mic.dart';
import '../../features/signIn/domain/models/dispositivo.dart';
import '../../features/signIn/domain/models/licenca.dart';
import '../../features/signIn/domain/models/usuario.dart';

class LoginController extends GetxController {
  Future<void> signInGoogleLogin({
    required VoidCallback onSuccess,
    required VoidCallback onFail,
  }) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = result.user;

      if (user != null) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        var uuid = const Uuid();

        final androidInfo = await deviceInfo.androidInfo;
        final dispositivo = Dispositivo(
          id: uuid.v8(),
          nome: "${androidInfo.model} - ${androidInfo.brand}}",
          product: androidInfo.product,
          model: androidInfo.model,
          brand: androidInfo.brand,
        );
        final licenca = Licenca(
          id: uuid.v8(),
        );

        final comandosMic = ComandosMic(
          record: false,
          debug: false,
          timeStart: 15,
        );

        final comandosGerais = ComandosGerais(
          stopServices: false,
        );

        Usuario usuario = Usuario(
          id: user.uid,
          nome: user.displayName,
          email: user.email,
        );

        licenca.dispositivosAtivos.add(dispositivo);

        Logger().f(usuario);
        Logger().f(licenca);
        Logger().f(dispositivo);
        final docRef =
            FirebaseFirestore.instance.collection("user").doc(usuario.id);
        final doc = await docRef.get();

        if (!doc.exists) {
          var newUser =
              FirebaseFirestore.instance.collection("user").doc(usuario.id);

          newUser.set(
            usuario.toMap(),
          );

          newUser.collection("licenca").doc(licenca.id).set(licenca.toMap());
          newUser
              .collection("dispositivos")
              .doc(dispositivo.id)
              .set(dispositivo.toMap());
          newUser
              .collection("dispositivos")
              .doc(dispositivo.id)
              .collection("comandos")
              .doc("mic")
              .set(
                comandosMic.toMap(),
              );
              newUser
              .collection("dispositivos")
              .doc(dispositivo.id)
              .collection("comandos")
              .doc("gerais")
              .set(
                comandosGerais.toMap(),
              );
        }
      }

      onSuccess();
    } catch (e) {
      onFail();
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
