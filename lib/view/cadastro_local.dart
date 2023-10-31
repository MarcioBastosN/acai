import 'package:acai/model/local.dart';
import 'package:acai/view/component/text_controller_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CadastroLocal extends StatefulWidget {
  const CadastroLocal({super.key});

  @override
  State<CadastroLocal> createState() => _CadastroLocalState();
}

class _CadastroLocalState extends State<CadastroLocal> {
  @override
  Widget build(BuildContext context) {
    var local = context.watch<Dadoslocal>().listaLocais;

    Local l = Get.find<Local>();

    final appbar = AppBar(
      title: const Text("tela cadastro"),
      actionsIconTheme: const IconThemeData(),
    );

    final sizescreen = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: appbar,
        body: Column(
          children: [
            SizedBox(
              height: (sizescreen.height - appbar.preferredSize.height) * .4,
              width: sizescreen.width,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Column(
                    children: [
                      MyCustonText(
                        controller: l.nomeLocal.value,
                        label: "Nome local",
                        inputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nome não pode ser vazio";
                          }
                          return null;
                        },
                      ),
                      MyCustonText(
                        perfixIcon: Icons.place,
                        controller: l.coordenada.value,
                        label: "Coordenada",
                        inputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "coordenada não pode ser vazio";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          l.valida(),
                          if (l.valide.isTrue)
                            {
                              // formKey.currentState!.deactivate(),
                              context.read<Dadoslocal>().registar(
                                  l.coordenada.value.text,
                                  l.nomeLocal.value.text)
                            }
                          else
                            {
                              formKey.currentState!.validate(),
                              Get.dialog(
                                const AlertDialog(
                                  title: Text("alert"),
                                ),
                              )
                            }
                        },
                        child: const Text("registar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LimitedBox(
              maxHeight: (sizescreen.height - appbar.preferredSize.height) * .6,
              child: ListView.builder(
                itemCount: local.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          local[index].nomeLocal.toString(),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 2.0,
                        ),
                        Text(
                          local[index].coordenada.toString(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
