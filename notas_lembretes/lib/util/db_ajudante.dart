import 'dart:io';
import 'package:notas_lembretes/modelos/nota.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db_ajudante {

  final String tabelaNotas = "notasTabela";
  final String colunaId = "id";
  final String colunaNome = "nome";
  final String colunaData = "data";

  Db_ajudante._privateConstructor();
  static final Db_ajudante _instance = Db_ajudante._privateConstructor();
  factory Db_ajudante() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db != null) return _db;
    _db = await initBd();
    return _db;
  }

  initBd() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path, "bd_principal.db");
    return await openDatabase(caminho,
      version: 1,
      onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      """
        CREATE TABLE $tabelaNotas (
          $colunaId INTEGER PRIMARY KEY, 
          $colunaNome TEXT NOT NULL, 
          $colunaData TEXT NOT NULL)
      """
    );
  }

  Future<int> salvarNota(Nota item) async {
    Database bdClient = await db;
    return await bdClient.insert("$tabelaNotas", item.toMap());
  }

  Future<List> bucarTodasNotas() async {
    Database bdClient = await db;
    var res = await bdClient.rawQuery("SELECT * FROM $tabelaNotas ORDER BY $colunaNome ASC");

    return res.toList();
  }

  Future<int> contagemNotas() async {
    Database bdClient = await db;
    return Sqflite.firstIntValue(await bdClient.rawQuery("SELECT COUNT(*) FROM $tabelaNotas"));
  }

  Future<Nota> buscarNota(int id) async {
    Database bdClient = await db;
    var res = await bdClient.rawQuery(
      """
        SELECT * FROM $tabelaNotas WHERE $colunaId = $id
      """
    );
    if(res.length == 0) return null;
    return Nota.fromMap(res.first);
  }

  Future<int> apagarNota(int id) async {
    Database bdClient = await db;
    return await bdClient.delete(
      tabelaNotas,
      where: "$colunaId = ?",
      whereArgs: [id]
    );
  }

  Future<int> atualizaNota(Nota nota) async {
    Database bdClient = await db;
    return await bdClient.update(
      tabelaNotas,
      nota.toMap(),
      where: "$colunaId = ?",
      whereArgs: [nota.id]
    );
  }

  Future fechar() async {
    Database bdClient = await db;
    return bdClient.close();
  }
}