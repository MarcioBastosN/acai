import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Local extends GetxController {
  Rx<TextEditingController> coordenada = TextEditingController().obs;
  Rx<TextEditingController> nomeLocal = TextEditingController().obs;

  RxBool valide = false.obs;

  valida() {
    if (coordenada.value.text.isNotEmpty && nomeLocal.value.text.isNotEmpty) {
      valide.value = true;
    } else {
      valide.value = false;
    }
  }
}

class Dadoslocal with ChangeNotifier {
  List<Dadoslocal> local = [];
  List<Dadoslocal> get listaLocais => [...local];

  String? coordenada;
  String? nomeLocal;

  registar(String coordenada, String nomeLocal) {
    var dados = Dadoslocal();
    dados.coordenada = coordenada;
    dados.nomeLocal = nomeLocal;
    local.add(dados);
    notifyListeners();
  }

  teste() {
    local.clear();
    for (var i = 0; i < 40; i++) {
      registar(i.toString(), "label - $i");
    }
  }
}
