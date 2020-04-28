import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();

  final TextEditingController _senhaController = new TextEditingController();

  String _bemVindo ="";

  void _mostraBemVindo(){
      setState(() {
        if(_usuarioController.text.isNotEmpty && _senhaController.text.isNotEmpty){
          // debugPrint(_senhaController.text);
          _bemVindo = 'Bem vindo ${_usuarioController.text}';
        }
        else{
          _bemVindo = 'Usuário Vazio';
        }
      });
  }

  void _cancelar(){
    setState(() {
      _usuarioController.clear();
      _senhaController.clear();
      _bemVindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,

        child: ListView(
          children: <Widget>[
            Image.asset("assets/logo_menu.png",
              width: 90.0,
              height: 90.0,
            ),

            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        hintText: "Nome",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5) 
                        ),
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5)
                        ),
                        icon: Icon(Icons.vpn_key)
                      ),
                      obscureText: true,
                    ),
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            // margin: const EdgeInsets.only(left: 47.0),
                            child: RaisedButton(onPressed: _mostraBemVindo,
                            color: Colors.white,
                            child: Text("Entrar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.9,

                              ),
                            ),
                          ),
                        ),

                        Container(
                          // margin: const EdgeInsets.only(left: 130.0),
                          child: RaisedButton(onPressed: _cancelar,
                          color: Colors.white,
                          child: Text("Cancelar"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("$_bemVindo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.6,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}