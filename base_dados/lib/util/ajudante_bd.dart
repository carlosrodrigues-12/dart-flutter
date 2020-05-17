import 'dart:io';
import 'package:base_dados/modelos/usuario.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BDadosAjudante{

  final String tabelaUsuario = "tabelaUsuario";
  final String colunaId = "id";
  final String colunaNome = "nome";
  final String colunaSenha = "senha";

  BDadosAjudante._privateConstructor();
  static final BDadosAjudante _instance = BDadosAjudante._privateConstructor();
  factory BDadosAjudante() => _instance;

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
        CREATE TABLE $tabelaUsuario (
          $colunaId INTEGER PRIMARY KEY, 
          $colunaNome TEXT NOT NULL, 
          $colunaSenha TEXT NOT NULL)
      """
    );
  }

  Future<int> inserirUsuario(Usuario usuario) async {
    Database bdClient = await db;
    return await bdClient.insert("$tabelaUsuario", usuario.toMap());
  }

  Future<List> pegarUsuarios() async {
    var bdClient = await db;
    var res = await bdClient.rawQuery("SELECT * FROM $tabelaUsuario");

    return res.toList();
  }

  Future<int> pegarContagem() async {
    Database bdClient = await db;
    return Sqflite.firstIntValue(await bdClient.rawQuery("SELECT COUNT(*) FROM $tabelaUsuario"));
  }

  Future<Usuario> pegarUsuario(int id) async {
    var bdClient = await db;
    var res = await bdClient.rawQuery(
      """
        SELECT * FROM $tabelaUsuario WHERE $colunaId = $id
      """
    );
    if(res.length == 0) return null;
    return Usuario.fromMap(res.first);
  }

  Future<int> apagarUsuario(int id) async {
    var bdClient = await db;
    return await bdClient.delete(
      tabelaUsuario,
      where: "$colunaId = ?",
      whereArgs: [id]
    );
  }

  Future<int> atualizarUsuario(Usuario usuario) async {
    var bdClient = await db;
    return await bdClient.update(
      tabelaUsuario,
      usuario.toMap(),
      where: "$colunaId = ?",
      whereArgs: [usuario.id]
    );
  }

  Future fechar() async {
    var bdClient = await db;
    return bdClient.close();
  }
}