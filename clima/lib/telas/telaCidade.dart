import 'package:flutter/material.dart';

class MudarCidade extends StatelessWidget{
  final TextEditingController cidadeCampoControl = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Mudar Cidade'),
      ),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Center(
            child: Image.asset('assets/white_snow.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          ListView(
            children: <Widget>[

              ListTile(
                title: TextField(
                  controller: cidadeCampoControl,
                  decoration: InputDecoration(
                    hintText: 'Cidade',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),

              ListTile(
                title: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {'cidade': cidadeCampoControl.text});
                  },
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: Text('Mostra o Tempo'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}