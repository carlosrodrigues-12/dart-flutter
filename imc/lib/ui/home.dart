import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String peso = "";
  String condicao = "";

  final TextEditingController _controleIdade = TextEditingController();
  final TextEditingController _controleAltura = TextEditingController();
  final TextEditingController _controlePeso = TextEditingController();

  void calculaImc(String idade, String altura, String peso){
    double resultado;

    setState(() {
      resultado = double.parse(peso)/(double.parse(altura)*double.parse(altura));
      this.peso = resultado.toStringAsFixed(2);
      _controleIdade.clear();
      _controleAltura.clear();
      _controlePeso.clear();
    });

    condicaoImc(resultado);
  }

  void condicaoImc(double resultado){
    if(resultado < 17) this.condicao = "Muito abaixo do peso";
      else if(resultado >= 17 && resultado <= 18.49) this.condicao = "Abaixo do peso";
        else if(resultado >=18.5 && resultado <= 24.99) this.condicao = "Peso normal";
          else if(resultado >=25 && resultado <= 29.99) this.condicao = "Acima do peso";
            else if(resultado >=30 && resultado <= 34.99) this.condicao = "Obesidade I";
              else if(resultado >=35 && resultado <= 39.99) this.condicao = "Obesidade II (severa)";
                else this.condicao = "Obesidade III (mórbida)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC"),
        backgroundColor: Colors.pink,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: const EdgeInsets.all(1.5),
            children: <Widget>[

              Image.asset('assets/imc_logo.png',
                height: 100.0,
                width: 200.0,
              ),
              
              Container(
                alignment: Alignment.center,
                color: Colors.grey[100],
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _controleIdade,
                      decoration: InputDecoration(
                        labelText: "Idade",
                        hintText: '32',
                        icon: Icon(Icons.person_outline)
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _controleAltura,
                      decoration: InputDecoration(
                        labelText: "Altura (m)",
                        hintText: '1.98',
                        icon: Icon(Icons.assignment),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _controlePeso,
                      decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        hintText: '90',
                        icon: Icon(Icons.line_weight),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(12.0),
                           child: Container(
                             child: RaisedButton(
                              onPressed: () => calculaImc(_controleIdade.text, _controleAltura.text, _controlePeso.text),
                              color: Colors.pinkAccent,
                              child: Text("Calcular",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                             ),
                           ),
                         )
                       ]
                    ),

                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$peso',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('$condicao',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.pink,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
      
    );
  }
}