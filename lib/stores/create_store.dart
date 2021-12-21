import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/helpers/extensions.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/models/address_model.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/cep_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;

abstract class _CreateStoreBase with Store {
  _CreateStoreBase(this._adModel) {
    if (_adModel != null) {
      title = _adModel!.title;
      description = _adModel!.description;
      images = _adModel!.images.asObservable();
      category = _adModel!.category;
      priceText = _adModel!.price.formattedMoney();
      hidePhone = _adModel!.hidePhone;

      cepStore = CEPStore(_adModel!.address.cep);
    } else {
      cepStore = CEPStore("");
    }
  }

  late AdModel? _adModel;

  //Images
  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;

  @computed
  String get imageError {
    if (!showErrors || imagesValid) {
      return "";
    } else {
      return 'Insira as imagens';
    }
  }

  //Title
  @observable
  String title = "";

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;

  @computed
  String? get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  //Description
  @observable
  String description = "";

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 6;

  @computed
  String? get descriptionError {
    if (!showErrors || descriptionValid) {
      return null;
    } else if (description.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  //Category
  @observable
  CategoryModel? category;

  @action
  void setCategory(CategoryModel value) => category = value;

  @computed
  bool get categoryValid => category != null;

  @computed
  String get categoryError {
    if (!showErrors || categoryValid) {
      return "";
    } else {
      return 'Campo obrigatório';
    }
  }

  //CEP
  late CEPStore cepStore;

  @computed
  AddressModel? get address => cepStore.address;

  @computed
  bool get addressValid => address != null;

  @computed
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  //Price
  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  double? get price {
    if (priceText.isNotEmpty && priceText.contains(',')) {
      return double.tryParse(priceText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    }

    return null;
  }

  @computed
  bool get priceValid => price != null && price! > 0 && price! <= 999999999;

  @computed
  String? get priceError {
    if (!showErrors || priceValid) {
      return null;
    } else if (priceText.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  //HidePhone
  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  //Button
  @computed
  bool get isFormValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @observable
  bool showErrors = false;

  @observable
  bool loading = false;

  @observable
  String erroSend = "";

  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  VoidCallback? get sendPressed => isFormValid ? _send : null;

  @observable
  AdModel? savedAd;

  @action
  Future<void> _send() async {
    loading = true;

    if (_adModel == null) {
      _adModel = AdModel(
        images: images,
        title: title,
        description: description,
        category: category!,
        address: address!,
        price: price!,
        hidePhone: hidePhone,
        userModel: GetIt.I<UserManagerStore>().userModel!,
      );
    } else {
      _adModel!.images = images;
      _adModel!.title = title;
      _adModel!.description = description;
      _adModel!.category = category!;
      _adModel!.address = address!;
      _adModel!.price = price!;
      _adModel!.hidePhone = hidePhone;
      _adModel!.userModel = GetIt.I<UserManagerStore>().userModel!;
    }

    try {
      savedAd = await AdRepository().save(_adModel!);
    } catch (e) {
      erroSend = e.toString();
    }

    loading = false;
  }
}
