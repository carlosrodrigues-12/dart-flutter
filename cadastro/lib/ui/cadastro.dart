import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 47.0),
                            child: RaisedButton(onPressed: () => null,
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
                          margin: const EdgeInsets.only(left: 130.0),
                          child: RaisedButton(onPressed: () => null,
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

          ],
        ),
      ),
    );
  }
}