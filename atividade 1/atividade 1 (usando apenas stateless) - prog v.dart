import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        body: Row(          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Container(
              margin: const EdgeInsets.all(10.0), //PESQUISAR EDGEINSETS
              color: Colors.red,
              width: 60.0,              
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Container(
                  color: Colors.green,
                  height: 60.0,
                  width: 60.0,
                ),
                
                Container(
                  color: Colors.purple,
                  height: 60.0,
                  width: 60.0,
                ),
                
              ],
            ),
            
            Container(
              margin: const EdgeInsets.all(10.0), //PESQUISAR EDGEINSETS
              color: Colors.blue,
              width: 60.0,
            ),
            
          ],
        ),
      ),
    );
  }
}

