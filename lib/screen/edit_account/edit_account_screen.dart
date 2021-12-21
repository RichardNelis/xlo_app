import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_app/stores/edit_account_store.dart';
import 'package:xlo_app/stores/page_store.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  late EditAccountStore store;

  @override
  void initState() {
    super.initState();

    store = EditAccountStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Conta"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(builder: (_, constraints) {
                    return Observer(
                      builder: (_) {
                        return IgnorePointer(
                          ignoring: store.isLoading,
                          child: ToggleSwitch(
                            minWidth: constraints.biggest.width / 2.01,
                            labels: const ["Particular", "Profissional"],
                            cornerRadius: 20,
                            initialLabelIndex: store.userType.index,
                            totalSwitches: 2,
                            activeBgColor: const [Colors.purple],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            onToggle: store.setUserType,
                          ),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        initialValue: store.name,
                        onChanged: store.setName,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: "Nome *",
                          enabled: !store.isLoading,
                          errorText: store.nameError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        initialValue: store.phone,
                        onChanged: store.setPhone,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: "Telefone *",
                          enabled: !store.isLoading,
                          errorText: store.phoneError,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        onChanged: store.setPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: "Nova Senha",
                          enabled: !store.isLoading,
                          errorText: store.passwordError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        onChanged: store.setConfirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: "Confirmar Nova Senha",
                          enabled: !store.isLoading,
                          errorText: store.confirmPasswordError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Observer(
                    builder: (_) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: store.savePressed,
                        child: store.isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Salvar"),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () async {
                          await store.userManagerStore.logout();                          
                          GetIt.I<PageStore>().setPage(0);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Sair"),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
