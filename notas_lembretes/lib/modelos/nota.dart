import 'package:flutter/material.dart';

class Nota extends StatelessWidget {
  String _notaNome;
  String _notaDataCriado;
  int _id;

  Nota(this._notaNome, this._notaDataCriado);

  Nota.map(dynamic obj){
    this._notaNome = obj['nome'];
    this._notaDataCriado = obj['data'];
    this._id = obj['id'];
  }

  String get notaNome => this._notaNome;
  String get notaDataCriacao => this._notaDataCriado;
  int get id => this._id;

  Map<String, dynamic> toMap(){
    var mapa = new Map<String, dynamic>();
    mapa['nome'] = _notaNome;
    mapa['data'] = _notaDataCriado;

    if(_id != null) mapa['id'] = _id;
    return mapa;
  }

  Nota.fromMap(Map<String, dynamic> mapa){
    this._notaNome = mapa['nome'];
    this._notaDataCriado = mapa['data'];
    this._id = mapa['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(notaNome, style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.9
          ),),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text("$_notaDataCriado",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11.5,
              fontStyle: FontStyle.italic
            ),),
          )
        ],
      ),
    );
  }
}