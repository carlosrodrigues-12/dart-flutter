import 'package:flutter/material.dart';
import 'notas_lembretes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Notas e Lembretes"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),

      body: NotasLembretes(),
    );
  }
}