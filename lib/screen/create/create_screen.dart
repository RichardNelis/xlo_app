import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:xlo_app/components/drawer/custom_drawer.dart';
import 'package:xlo_app/components/error/error_box.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/screen/my_ads/my_ads_screen.dart';
import 'package:xlo_app/stores/create_store.dart';
import 'package:xlo_app/stores/page_store.dart';

import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class CreateScreen extends StatefulWidget {
  final AdModel? ad;

  const CreateScreen({Key? key, required this.ad}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late CreateStore store;
  late bool editing = false;

  @override
  void initState() {
    super.initState();

    store = CreateStore(widget.ad);
    editing = widget.ad != null;

    //Dispose automatic
    when((_) => store.savedAd != null, () {
      if (editing) {
        Navigator.of(context).pop(true);
      } else {
        GetIt.I<PageStore>().setPage(0);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const MyAdsScreen(initialPage: TabPage.pending),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    const focusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purple),
    );

    const contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      appBar: AppBar(
        title: Text((editing ? "Editar" : "Criar") + " Anúncio"),
        centerTitle: true,
      ),
      drawer: editing ? null : const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Observer(
              builder: (_) {
                if (store.loading) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Text(
                          "Salvando anúncio...",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 16),
                        CircularProgressIndicator(color: Colors.purple),
                      ],
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImagesField(store: store),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          onChanged: store.setTitle,
                          initialValue: store.title,
                          decoration: InputDecoration(
                            labelText: "Título *",
                            labelStyle: labelStyle,
                            focusedBorder: focusedBorder,
                            contentPadding: contentPadding,
                            errorText: store.titleError,
                          ),
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          maxLines: null,
                          initialValue: store.description,
                          onChanged: store.setDescription,
                          decoration: InputDecoration(
                            labelText: "Descrição *",
                            labelStyle: labelStyle,
                            focusedBorder: focusedBorder,
                            contentPadding: contentPadding,
                            errorText: store.descriptionError,
                          ),
                        );
                      },
                    ),
                    CategoryField(store: store),
                    CEPField(createStore: store),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          initialValue: store.priceText,
                          onChanged: store.setPrice,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Preço *",
                            labelStyle: labelStyle,
                            focusedBorder: focusedBorder,
                            contentPadding: contentPadding,
                            errorText: store.priceError,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter(moeda: true)
                          ],
                        );
                      },
                    ),
                    HidePhoneField(store: store),
                    ErrorBox(message: store.erroSend),
                    Observer(
                      builder: (_) {
                        return GestureDetector(
                          onTap: store.invalidSendPressed,
                          child: MaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            disabledTextColor: Colors.orange,
                            elevation: 0,
                            height: 50,
                            textColor: Colors.white,
                            onPressed: store.sendPressed,
                            child: const Text(
                              "Enviar",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
