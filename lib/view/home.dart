import 'package:acai/model/login.dart';
import 'package:acai/view/component/text_controller_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Login l = Get.put(Login());

  @override
  Widget build(BuildContext context) {
    final fText = FocusNode();

    l.valida();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "teste variavel ${l.user.value.text.toString()}",
            ),
            MyCustonText(
              controller: l.user.value,
              label: "Nome",
              inputType: TextInputType.text,
              focus: fText,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
                l.valida();
              },
              perfixIcon: Icons.person,
            ),
            MyCustonText(
              controller: l.password.value,
              label: "Senha",
              inputType: TextInputType.visiblePassword,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
                l.valida();
              },
              obscureText: true,
              perfixIcon: Icons.key_off,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: l.valide.value == true ? Colors.green : Colors.red,
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
