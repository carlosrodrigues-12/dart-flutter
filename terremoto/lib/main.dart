import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() async {

  // Intl.defaultLocale = "pt_BR";

  Map _dados = await getJson();

  DateTime date = DateTime.fromMicrosecondsSinceEpoch(_dados['features'][0]['properties']['time']*1000);
  var format = DateFormat('dd MMMM yyyy');
  var dateStri = format.format(date);
  debugPrint(dateStri);

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
              itemBuilder: (BuildContext context, int posicao){
                return Column(
                  children: <Widget>[
                    Divider(height: 5.5, color: Colors.green,),
                    ListTile(
                      title: Text("${format.format(DateTime.fromMicrosecondsSinceEpoch(_dados['features'][posicao]['properties']['time']*1000))}"),
                      subtitle: Text("${_dados['features'][posicao]['properties']['place']}"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text("${_dados['features'][posicao]['properties']['mag']}",
                          style: TextStyle(fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ),

      ),
    ),
  );
}

// void recebeApi () async {
//   Map _dados = await getJson();
//   String _body = '';
//   debugPrint("${_dados['features'][0]['type']}");
//   debugPrint("${_dados['features'][0]['properties']['mag']}");
//   debugPrint("${_dados['features'][0]['properties']['place']}");
//   debugPrint("${_dados['features'][0]['properties']['title']}");
//   debugPrint("${_dados['features'][0]['geometry']['type']}");
//   debugPrint("${_dados['features'][0]['geometry']['coordinates']}");
//   debugPrint("${_dados['features'][0]['id']}");
// }

Future<Map> getJson () async {
  String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(url);

  if(response.statusCode == 200) return json.decode(response.body);
    else throw Exception('Falhou');
}