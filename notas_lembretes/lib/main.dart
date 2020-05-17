import 'package:flutter/material.dart';
import 'package:notas_lembretes/ui/home.dart';

void main() => runApp(new Notas());

class Notas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas e Lembretes',
      home: Home(),
    );
  }
}