import 'package:acai/src/util/tabelas_db.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class TabelasDB {
  static const String tbDefinicoes =
      "CREATE TABLE ${NomeTabelaDB.definicoesJogo} (id INTEGER PRIMARY KEY AUTOINCREMENT, entrada_valor INTEGER)";
}

class DbUtil {
  static Future<void> criarTabelasBanco(sql.Database db, int version) async {
    List<String> queryes = [
      TabelasDB.tbDefinicoes,
    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'acai.db'),
      onCreate: (db, version) => criarTabelasBanco(db, version),
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, int? id) async {
    final db = await DbUtil.database();
    await db.rawDelete(
      "DELETE FROM $table wHERE id = ?",
      [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String tabela) async {
    final db = await DbUtil.database();
    return db.query(tabela);
  }

  static Future<void> update(
      String tabela, int chave, Map<String, dynamic> data) async {
    final db = await DbUtil.database();
    await db.update(tabela, data, where: 'id = ?', whereArgs: [chave]);
  }
}
