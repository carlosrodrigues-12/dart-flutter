import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radioValor = 1;
  String _nomePlaneta = "";

  final TextEditingController _controlePeso = TextEditingController();

  bool selecaoValorA = true, selecaoValorB = false, selecaoValorC, switchValor = false;

  double _resultadoFinal;

  void tomacontaValorRadio(int valor){
    setState(() {
      radioValor = valor;
      switch(radioValor){
        case 0:
          _resultadoFinal=calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          _nomePlaneta = "O seu peso no planeta Plutão é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
        case 1:
          _resultadoFinal=calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          _nomePlaneta = "O seu peso no planeta Marte é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
        case 2:
          _resultadoFinal=calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          _nomePlaneta = "O seu peso no planeta Vênus é ${_resultadoFinal.toStringAsFixed(2)}";
          break;
        default:
          debugPrint("Nada foi selecionado");  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset('assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),

            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'O seu peso na terra',
                      hintText: 'Kg',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValor,
                        onChanged: tomacontaValorRadio,
                      ),
                      Text("Plutão",
                        style: TextStyle(
                          color: Colors.white30,
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValor,
                        onChanged: tomacontaValorRadio,
                      ),
                      Text("Marte",
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValor,
                        onChanged: tomacontaValorRadio,
                      ),
                      Text("Vênus",
                        style: TextStyle(
                          color: Colors.white30
                        ),
                      )
                    ],
                  ),
                  
                  Text(
                    _controlePeso.text.isEmpty ? "Insira o peso" : _nomePlaneta + " Kg",
                    // "$_nomePlaneta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial){
    if(int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0){
      return (int.parse(peso) * gravidadeSuperficial);
    }
      else{
        print('Numero errado');
      }
  }
}