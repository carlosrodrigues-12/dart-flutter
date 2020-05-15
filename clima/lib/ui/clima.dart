import 'package:clima/telas/telaCidade.dart';
import 'package:clima/transacoes/pega_clima.dart';
import 'package:flutter/material.dart';
import 'package:clima/util/util.dart' as util;
import 'dart:async';

class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  String _cidadeInsert;
  String teste;

  void atualizarInfo(String b){
    setState(() {
      teste = b;
    });
  }

  Future _abrirNovaTela(BuildContext context) async {
      Map resultado = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (context) => MudarCidade(),
      ),);
      if(resultado != null && resultado.containsKey('cidade')){
        _cidadeInsert = resultado['cidade'];
        teste = resultado['name'];
        atualizarInfo(teste);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(centerTitle: true,
        title: Text("Clima"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),
            onPressed: () => _abrirNovaTela(context),
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/umbrella.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 220),
            alignment: Alignment.center,
            child: Image.asset('assets/light_rain.png'),
          ),
          atualizaTWidget(_cidadeInsert),
        ],
      ),
    );
  }

  Widget atualizaTWidget(String cidade){
    return FutureBuilder(
      future: pegaClima(util.appId, cidade == null ? util.minhaCidade : cidade),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        debugPrint(snapshot.hasData.toString());
        if(snapshot.hasData){
          Map conteudo = snapshot.data;
            return Container(
              margin: const EdgeInsets.fromLTRB(30.0, 270.0, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cidade: ${conteudo['name'].toString()}\n",
                      style: styleCidade(),
                    ),
                  ),
                  ListTile(
                    title: Text(conteudo['main']['temp'].toString()+" C°",
                    style: tempStyle(),),
                    subtitle: ListTile(
                      title: Text("Umidade: ${conteudo['main']['humidity'].toString()}\n"
                        "Min: ${conteudo['main']['temp_min'].toString()} C°\n"
                        "Min: ${conteudo['main']['temp_max'].toString()} C°",
                        style: extraTemp(),
                      ),
                    ),
                  ),
                ],
              ),
            );
        } else{
            debugPrint("falhou atualizar tela");
            return Container(
              child: Text('Falhou'),
          );}
      },
    );
  }
}

TextStyle extraTemp(){
  return TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 19.0,
  );
}

TextStyle styleCidade(){
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 49.9,
    fontStyle: FontStyle.normal
  );
}