import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "I/O",
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _campoDadosControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Ler/Gravar"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),

      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _campoDadosControl,
              decoration: InputDecoration(labelText: "Escreva algo",),
            ),
            Padding(padding: const EdgeInsets.all(14.9),),
            FlatButton(onPressed: () => gravarDados(_campoDadosControl.text),
              child: Text('Gravar'),
              color: Colors.greenAccent,
            ),
            FutureBuilder(
              future: lerDados(),
              builder: (BuildContext context, AsyncSnapshot<String> dados){
                if(dados.hasData != null) return Text(dados.data, style: TextStyle(color: Colors.pink),);
                  else{return Text('Nada foi salvo');}
              }
            ),
          ]
        ),
      ),
      
    );
  }
}

Future<String> get _caminhoLocal async {
  final diretorio = await getApplicationDocumentsDirectory();
  return diretorio.path;
}

Future<File> get _arquivoLocal async {
  final caminho = await _caminhoLocal;
  return File('$caminho/dados.txt');
}

Future<File> gravarDados(String mensagem) async {
  final arquivo = await _arquivoLocal;
  return arquivo.writeAsString('$mensagem');
}

Future<String> lerDados () async {
  try{
    final arquivo = await _arquivoLocal;
    return await arquivo.readAsString();
  }catch(e){
    return "Ainda não foi salvo nenhum dado.";
  }
}