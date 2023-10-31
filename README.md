# acai

A new Flutter project.

## Getting Started
<!-- Rodar o projeto (vai rodar de acordo com device conectado)! -->
    flutter run
<!-- compilar o projeto android-->
    flutter build apk 
<!-- caminho do arquivo compilado -->
    build/app/outputs/flutter-apk/app-release.apk
<!-- Duvidas, consultar a documentação -->
https://docs.flutter.dev/


<!-- Passos para adicionar uma nova tela -->
    - 1 Adicionar o nome da tela no (/util/routes.dart)
        - 1.1 O nome das rotas deve inicar com "/"
    - 2 Registrar a rota em (/util/page_routes.dart)
<!-- passos para criar e registar uma tabela no banco de dados -->
    - 1 Declarar o nome da tabela no arquivo (/util/tabelas_db.dart)
    - 2 Criar a tabela em (/util/db_util.dart)
    - 2.1 Declarar a a estrutura da tabela na class (TabelasDB)
    - 2.2 A estrutura deve seguir o modelo:
        "CREATE TABLE ${NomeTabelaDB.nome} (id INTEGER PRIMARY KEY AUTOINCREMENT, nome_do_campo TIPO_DE_DADO, ..., nome_do_campo TIPO_DE_DADO)";
<!--  -->
