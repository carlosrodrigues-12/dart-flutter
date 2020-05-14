import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as data;

void main() async {

  data.initializeDateFormatting("pt_BR", null);

  Map _dados = await getJson();

  // var format = DateFormat('dd MMMM yyyy');
  var format = DateFormat.yMMMMd("pt_BR").add_jm();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar:
          AppBar(
            centerTitle: true,
            title: Text('Terremoto'),
          ),

        body:
          Center(
            child: ListView.builder(
              itemCount: _dados['features'].length,
              itemBuilder: (BuildContext context, int posicao){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Divider(height: 5.5),
                      ListTile(
                        title: Text(
                          "${format.format(DateTime.fromMicrosecondsSinceEpoch(_dados['features'][posicao]['properties']['time']*1000))}",
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange),
                        ),
                        subtitle: Text(
                          "${_dados['features'][posicao]['properties']['place']}",
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text("${_dados['features'][posicao]['properties']['mag']}",
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontStyle: FontStyle.normal
                            ),
                          ),
                        ),
                        onTap: () => _mostraMsg(context, _dados['features'][posicao]['properties']['title']),
                      )
                    ],
                  ),
                );
              },
            )
          ),

      ),
    ),
  );
}

void _mostraMsg(BuildContext context, String mensagem) {
  var alert = AlertDialog(
    title: Text('Terremoto'),
    content: Text(mensagem),
    actions: <Widget>[
      FlatButton(onPressed: (){
        Navigator.pop(context);
      },
      child: Text('OK'),
      ),
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<Map> getJson () async {
  String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(url);

  if(response.statusCode == 200) return json.decode(response.body);
    else throw Exception('Falhou');
}