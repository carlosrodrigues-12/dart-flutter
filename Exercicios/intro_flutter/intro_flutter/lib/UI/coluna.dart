import 'package:flutter/material.dart';

class Coluna extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      color: Colors.orangeAccent,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            "Primeiro",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15.0,
            ),
          ),

          // Expanded(
          //   child: Text("Ola"),
          // ),

          // Flexible(
          //   child: Text("Outro"),
          // ),

          // Flexible(
          //   child: Text("Ainda"),
          // ),

          Padding(
            padding: EdgeInsets.all(13.0),
              child: FlatButton(
                onPressed: () => {},
                child: Text("Botao")
              ),
          ),

          Text(
            "Segundo",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15.0,
            ),
          ),

          FlatButton(
            color: Colors.white,
            onPressed: ()=> "Hello",
            child: Text("Botao"),
          )
        ],
      )
    );
  }
}