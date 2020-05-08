import 'package:flutter/material.dart';

class Magnata extends StatefulWidget {
  int _contadorDinheiro = 0;

  @override
  _MagnataState createState() => _MagnataState();
}

class _MagnataState extends State<Magnata> {
  Color cor = Colors.green;
  int _contadorDinheiro = 0;

  void _adicionaDinheiro(){
    setState(() {
      _contadorDinheiro = _contadorDinheiro + 100;
    });
    if(_contadorDinheiro==11000){
      cor = Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Magnata"),
        backgroundColor: Colors.lightGreen,
      ),

      body: Container(
        child: Column(
          children: <Widget>[

            Center(
              child: Text("Fique Rico!",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 29.9,
                ),
              ),
            ),

            Expanded(child: Center(
              child: Text("\$ $_contadorDinheiro",
                style: TextStyle(
                  fontSize: 45.5,
                  color: cor,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),),

            Expanded(child: Center(
              child: FlatButton(onPressed: _adicionaDinheiro,
                color: Colors.lightGreen,
                textColor: Colors.white70,
                child: Text("Mais dinheiro",
                  style: TextStyle(fontSize: 19.9),
                ),
              ),
            ),),

          ],
        ),
      ),
    );
  }
}