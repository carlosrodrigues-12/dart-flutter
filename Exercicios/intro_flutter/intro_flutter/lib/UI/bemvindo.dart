import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Center(
        child: new Text(
          "Carlos Rodrigues",
          textDirection: TextDirection.ltr,
          style: new TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        )
      ),
    );
  }
}