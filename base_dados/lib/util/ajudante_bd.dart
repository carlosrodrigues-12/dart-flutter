import 'dart:io';
import 'package:base_dados/modelos/usuario.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BDadosAjudante{
  static final BDadosAjudante _instance = new BDadosAjudante.internal();
  factory BDadosAjudante() => _instance;

  final String tabelaUsuario = "tabelaUsuario";
  final String colunaId = "id";
  final String colunaNome = "nome";
  final String colunaSenha = "senha";

  static Database _db;
  Future<Database> get db async {
    if(_db != null) return _db;
    _db = await initBd();
  }
  

  BDadosAjudante.internal();

  initBd() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path, "bd_principal.db");
    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $tabelaUsuario($colunaId INTEGER PRIMARY KEY,"
    "$colunaNome TEXT,"
    "$colunaSenha TEXT");
  }

  Future<int> inserirUsuario(Usuario usuario) async {
    var bdClient = await db;
    int res = await bdClient.insert("$tabelaUsuario", usuario.toMap());
    return res;
  }

  Future<List> pegarUsuarios() async {
    var bdClient = await db;
    var res = await bdClient.rawQuery("SELECT * FROM $tabelaUsuario");

    return res.toList();
  }

  Future<int> pegarContagem() async {
    var bdClient = await db;
    return Sqflite.firstIntValue(await bdClient.rawQuery("SELECT COUNT(*) FOM $tabelaUsuario"));
  }
}