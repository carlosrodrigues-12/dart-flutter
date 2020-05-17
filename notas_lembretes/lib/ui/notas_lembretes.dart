import 'package:flutter/material.dart';
import 'package:notas_lembretes/modelos/nota.dart';
import 'package:notas_lembretes/util/db_ajudante.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:sqflite/sqflite.dart';

class NotasLembretes extends StatefulWidget {
  @override
  _NotasLembretesState createState() => _NotasLembretesState();
}

class _NotasLembretesState extends State<NotasLembretes> {

  final TextEditingController _control = TextEditingController();
  final List<Nota> _notaLista = <Nota>[];
  var db = new Db_ajudante();

  @override
  void initState() {
    super.initState();
    _pegarNotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _notaLista.length,
              itemBuilder: (BuildContext context, int posicao){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                    title: _notaLista[posicao]/* Text('Teste') */,
                    onLongPress: () => _atualizarNota(_notaLista[posicao], posicao),
                  ),
                );
              }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _mostrarFormulario,
      ),
    );
  }

  void _pegarNotas() async {
    List notas = await db.bucarTodasNotas();
    notas.forEach((item) {
      setState((){
        _notaLista.add(Nota.map(item));
      });
    });
  }

  void _mostrarFormulario(){
    var alert = AlertDialog(

      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Notas',
                hintText: 'Estudar',
                icon: Icon(Icons.note_add),
              ),
            ),
          )
        ],
      ),

      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _trabalhaTexto(_control.text);
            _control.clear();
            Navigator.pop(context);
          },
          child: Text('Salvar'),
        ),
      ],
    );

    showDialog(context: context, builder: (context){
      return alert;
    });
  }

  void _trabalhaTexto(String text) async {
    _control.clear();

    Nota nota = new Nota(text, dataFormatada());

    int salvoId = await db.salvarNota(nota);

    Nota itemSalvo = await db.buscarNota(salvoId);

    setState(() {
      _notaLista.insert(0, itemSalvo);
    });
  }

  String dataFormatada() {
    var agora = DateTime.now();
    initializeDateFormatting("pt_BR", null);
    var format = new DateFormat.yMMMd('pt_BR');
    return format.format(agora);
  }

  _atualizarNota(Nota notaLista, int posicao){
    var alert = AlertDialog(
      title: Text('Atualizar Nota'),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Nota',
                icon: Icon(Icons.update),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {
            Nota atualizarItem = new Nota.fromMap({
              "nome" : _control.text,
              "data" : dataFormatada(),
              "id" : notaLista.id
            });
            _trabalhaAtualizacao(posicao, notaLista);
            await db.atualizaNota(atualizarItem);
            
            setState(() {
              
            });
          },
          child: Text('Atualizar'),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        )
      ],
    );
    
    showDialog(context: context, builder: (context){
      return alert;
    });
  }

  _trabalhaAtualizacao(int posicao, Nota nota){
    setState(() {
      _notaLista.removeWhere((elemento) {
        _notaLista[posicao].notaNome == nota.notaNome;
      });
    });
  }
}