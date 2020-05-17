import 'package:base_dados/util/ajudante_bd.dart';
import 'package:flutter/material.dart';
import 'modelos/usuario.dart';

List user;
var db = new BDadosAjudante();
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base de Dados',
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('B-Dados'),
          backgroundColor: Colors.black38,
        ),

        body: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int posicao){
                  return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('w'),
                      ),
                    ),
                  );
                }
              ),
    );
  }
}
// class Home extends StatelessWidget {
//   int x;
//   int usuarioSalvo;
//   Usuario teste = Usuario("Kamila", "carlos35456");
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('B-Dados'),
//     //     backgroundColor: Colors.black38,
//     //   ),
//     //   body: ListView.builder(
//     //           itemCount: 4,
//     //           itemBuilder: (BuildContext context, int posicao){
//     //             return Card(
//     //               color: Colors.white,
//     //               elevation: 2.0,
//     //               child: ListTile(
//     //                 leading: CircleAvatar(
//     //                   child: Text('${db.pegarContagem().toString()}'),
//     //                 ),
//     //               ),
//     //             );
//     //           }
//     //         ),
//     // );
//   }
// }

// void inserir(Usuario teste, int usuarioSalvo) async {
//   usuarioSalvo = await db.inserirUsuario(teste);
//   print("Usuario foi inserido $usuarioSalvo\n");
// }

// void pegaContagem() async {
//   int contagem = await db.pegarContagem();
//   print("Quantidade: $contagem");
// }

// void consultaUser() async {
//   Usuario user = await db.pegarUsuario(1);
//   print(user.nome);
// }

// void atualizaUser() async {
//   Usuario aux = Usuario.fromMap(
//     {
//       "nome" : "Carlos",
//       "senha" : "12345566",
//       "id" : 1
//     }
//   );
//   int x = await db.atualizarUsuario(aux);
//   print("Atualizado: $x");
// }

// void apagaUser() async {
//   int user = await db.apagarUsuario(1);
//   print(user);
// }

// void recuperatodosUser() async {
//   user = await db.pegarUsuarios();
//   for(int i=0; i<user.length; i++){
//     print("Usuário -> ${user[i]['nome'].toString()}, ID -> ${user[i]['id'].toString()}");
//   }
// }