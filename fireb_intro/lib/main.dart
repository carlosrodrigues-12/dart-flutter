import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Firestore db = Firestore.instance;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      // Firestore.instance.collection('compras').document()
      // .setData(
      //   {
      //     'Ordem de compra': 83930,
      //     'Cotação': 546987,
      //     'Requisição': 548798
      //   }
      // );

      // Firestore.instance.collection('compras').getDocuments();

      // Firestore.instance.collection('notas').document()
      // .setData({
      //   "Numero": 10196,
      //   "Fornecedor": 13257
      // });

      // Firestore.instance.document("notas").get().then((document){
      //   print(document['Fornecedor']);
      // });

      // db.collection('notas').document('M1AcQDoc63SKdRtqRsux')
      // .get().then((DocumentSnapshot doc){
      //   print(doc.data['Fornecedor'].toString());
      // });

      // Firestore.instance.collection('notas').document('notas-fiscais')
      // .setData({
      //   "Numero": 11196,
      //   "Fornecedor": 14233
      // });

      // db.collection('notas').document('notas-fiscais')
      // .get().then((DocumentSnapshot doc){
      //   print("Numero da nota -> ${doc.data['Numero'].toString()}\n"+
      //   "Fornecedor -> ${doc.data['Fornecedor'].toString()}\nss");
      // });

      // db.collection('notas').document('notas-fiscais')
      // .setData({
      //   "Numero": 456214,
      //   "Fornecedor": 14555
      // });

      // db.collection('notas').document('notas-fiscais')
      // .collection('notas-encerradas').document('encerradas').setData({
      //   "Numero": 456258,
      //   "Fornecedor": 456125
      // });

      // db.collection('notas').document('notas-fiscais').delete();

      // db.collection('people').document().up

      // db.collection('compras').document('fzy6YR6HshpULAd36aEe').delete();
      // db.collection('compras').document('ilhjMkOrg58cXZL0yqwB').delete();

      // database.reference().child("compras").once().then((DataSnapshot dados) {
      //   Map<dynamic, dynamic> mapa = dados.value;
      //   print("Valores Firebase: ${mapa.values}");
      // });

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String key;
  String subject;
  bool completed;
  String userId;

  Todo(this.subject, this.userId, this.completed);

  Todo.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userId = snapshot.value["userId"],
    subject = snapshot.value["subject"],
    completed = snapshot.value["completed"];

  toJson(){
    return {
      "userId": userId,
      "subject": subject,
      "completed": completed
    };
  }
}