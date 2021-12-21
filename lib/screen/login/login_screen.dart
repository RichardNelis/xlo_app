import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/components/error/error_box.dart';
import 'package:xlo_app/screen/sign_up/sign_up_screen.dart';
import 'package:xlo_app/stores/login_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginStore store;
  late UserManagerStore _userManagerStore;

  @override
  void initState() {
    super.initState();

    store = LoginStore();
    _userManagerStore = GetIt.I<UserManagerStore>();

    when((_) => _userManagerStore.userModel != null, () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Acessar com E-mail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ErrorBox(
                            message: store.error,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 3.0, bottom: 4.0, top: 8.0),
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.emailError,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: store.setEmail,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Senha",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.passwordError,
                          ),
                          obscureText: true,
                          onChanged: store.setPassword,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 12),
                          height: 40,
                          child: ElevatedButton(
                            onPressed: store.loginPressed,
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
                                    "ENTRAR",
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
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            "Não tem uma conta? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Cadastre-se",
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
