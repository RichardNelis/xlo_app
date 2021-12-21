import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/components/error/error_box.dart';
import 'package:xlo_app/screen/sign_up/components/field_title.dart';
import 'package:xlo_app/stores/sign_up_store.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpStore store = SignUpStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ErrorBox(message: store.error),
                        );
                      },
                    ),
                    const FieldTitle(
                      title: "Apelido",
                      subTitle: "Como aparecerá em seus anúncios",
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Exemplo: João Silva",
                            isDense: true,
                            errorText: store.nameError,
                          ),
                          onChanged: store.setName,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const FieldTitle(
                      title: "E-mail",
                      subTitle: "Enviaremos um e-mail de confirmação",
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Exemplo: email@email.com",
                            isDense: true,
                            errorText: store.emailError,
                          ),
                          onChanged: store.setEmail,
                          keyboardType: TextInputType.emailAddress,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const FieldTitle(
                      title: "Celular",
                      subTitle: "Proteja sua conta",
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Exemplo: (99) 99999-9999",
                            isDense: true,
                            errorText: store.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: store.setPhone,
                          autocorrect: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const FieldTitle(
                      title: "Senha",
                      subTitle: "Use letras, números e caracteres especiais",
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: store.passwordError),
                          obscureText: true,
                          onChanged: store.setPassword,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const FieldTitle(
                      title: "Confirmar Senha",
                      subTitle: "Repita sua senha",
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              isDense: true,
                              errorText: store.confirmPasswordError),
                          obscureText: true,
                          onChanged: store.setConfirmPassword,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: ElevatedButton(
                            onPressed: store.signUpPressed,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: store.loading
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "CADASTRAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    const Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta?",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: const Text(
                              "Entrar",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
