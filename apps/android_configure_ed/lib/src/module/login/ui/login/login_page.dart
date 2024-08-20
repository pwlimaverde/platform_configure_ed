import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  onPressed: () async {
                    if (controller.identificacao.value.isNotEmpty) {
                      await controller.signInGoogleLogin(
                        onSuccess: () {
                          Get.snackbar("Sucesso", "Sucesso ao fazer login");
                          // Get.toNamed("/login");
                        },
                        onFail: () {
                          Get.snackbar("Erro", "Erro ao fazer login");
                        },
                      );
                    } else {
                      _mostrarDialogoApelido(onSuccess: (String apelido) async {
                        await controller.setIdentificacao(apelido);
                        await controller.signInGoogleLogin(
                          onSuccess: () {
                            Get.snackbar("Sucesso", "Sucesso ao fazer login");
                            // Get.toNamed("/login");
                          },
                          onFail: () {
                            Get.snackbar("Erro", "Erro ao fazer login");
                          },
                        );
                      });
                    }
                  },
                  icon: const FaIcon(FontAwesomeIcons.google)),
            ),
          ),
        ],
      ),
    );
  }
}

void _mostrarDialogoApelido({
  required Function(String nome) onSuccess,
}) {
  final TextEditingController nomeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Get.defaultDialog(
    title: "Dispositivo",
    middleText: "Digite um apelido para o Dispositivo!",
    content: Form(
      key: formKey, // Associe a chave ao formulário
      child: TextFormField(
        controller: nomeController,
        decoration: const InputDecoration(
          hintText: "Digite o Apelido",
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, digite um apelido';
          }
          if (value.length < 4) {
            return 'O apelido deve ter pelo menos 4 caracteres';
          }
          return null;
        },
      ),
    ),
    textConfirm: "Sim",
    textCancel: "Não",
    confirmTextColor: Colors.white,
    onConfirm: () {
      if (formKey.currentState!.validate()) {
        // Verifique se o formulário é válido
        onSuccess(nomeController.text);
        Get.back(); // Fecha o diálogo
      }
    },
    onCancel: () {
      Get.back(); // Fecha o diálogo
    },
  );
}
