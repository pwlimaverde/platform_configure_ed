import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    mostrarDialogoApelido(onSuccess: (String apelido) {
                      controller.signInGoogleLogin(
                        apelido: apelido,
                        onSuccess: () {
                          Get.snackbar("Sucesso", "Sucesso ao fazer login");
                          // Get.toNamed("/login");
                        },
                        onFail: () {
                          Get.snackbar("Erro", "Erro ao fazer login");
                        },
                      );
                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.google)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: IconButton(
                  onPressed: () {
                    controller.logOut(
                      onSuccess: () {
                        Get.snackbar("Sucesso", "Sucesso ao fazer LogOut");
                      },
                      onFail: () {
                        Get.snackbar("Erro", "Erro ao fazer LogOut");
                      },
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            ),
          ),
        ],
      ),
    );
  }
}

void mostrarDialogoApelido({
  required Function(String nome) onSuccess,
}) {
  final TextEditingController nomeController = TextEditingController();
  Get.defaultDialog(
    title: "Dispositivo",
    middleText: "Digite um apelido para o Dispositivo!",
    content: TextField(
      controller: nomeController,
      decoration: const InputDecoration(
        hintText: "Digite o Apelido",
      ),
    ),
    textConfirm: "Sim",
    textCancel: "Não",
    confirmTextColor: Colors.white,
    onConfirm: () {
      onSuccess(nomeController.text);
      Get.back(); // Fecha o diálogo
    },
    onCancel: () {
      Get.back(); // Fecha o diálogo
    },
  );
}
