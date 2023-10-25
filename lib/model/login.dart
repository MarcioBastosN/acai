import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetxController {
  RxBool valide = false.obs;

  Rx<TextEditingController> user = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;

  valida() {
    if (user.value.text.isNotEmpty && password.value.text.isNotEmpty) {
      valide.value = true;
    } else {
      valide.value = false;
    }
  }
}
