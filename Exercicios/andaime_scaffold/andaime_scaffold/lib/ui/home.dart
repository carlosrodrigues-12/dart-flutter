import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Scaffold-Andaime"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.accessible) ,onPressed: () => debugPrint("Teste"),),
          IconButton(icon: new Icon(Icons.print), onPressed: () => debugPrint("Print"),),
          IconButton(icon: new Icon(Icons.account_circle), onPressed: () => debugPrint("Account"),)
        ],
      ),

      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Carlos",
              style: TextStyle(
                fontSize: 19.5,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.greenAccent,
          icon: Icon(Icons.access_alarm),
          title: Text('Alarme'),
        ),
      ],
      ),

      );
  }
}