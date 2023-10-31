import 'package:acai/src/util/routes.dart';
import 'package:acai/view/cadastro_local.dart';
import 'package:acai/view/home.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const MyHomePage(title: "Home"),
    ),
    GetPage(
      name: AppRoutes.cadastroLocal,
      page: () => const CadastroLocal(),
    ),
  ];
}
