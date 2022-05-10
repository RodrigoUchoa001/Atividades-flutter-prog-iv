// Copyright 2015 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

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
      home: const PaginaInicial(titulo: 'Meu Aplicativo'),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  final String titulo;

  // N ENTENDI
  const PaginaInicial({Key? key, required this.titulo, }) : super(key: key);
  
  //PESQUISAR CREATESTATE NO STATEFULWIDGET
  @override
  State<PaginaInicial> createState() => _MinhaPaginaInicial();
}

class _MinhaPaginaInicial extends State<PaginaInicial> {
//   String txt = 'aplicativo funcionando';
//   String txt2 = 'o texto mudou de novo';

//   void mudaTexto() {
//     if (txt == 'o texto mudou') {
//       setState(() {
//         txt = txt2;
//       });
//     } else {
//       setState(() {
//         txt = 'o texto mudou';
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    
    // PESQUISAR O SCAFFOLD
    return Scaffold(
      body: Row( //N DEVERIA SER COLUNA AQUI??
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0), //PESQUISAR EDGEINSETS
            color: Colors.red,
            width: 60.0,
          ),
          
          Column( //N DEVERIA SER LINHA AQUI??
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [              
              Container(
                color: Colors.green,
                height: 60.0,
                width: 60.0,
              ),
    //             Text(
    //              txt,
    //            ),

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
//       floatingActionButton: FloatingActionButton(
//         onPressed: mudaTexto,
//         child:
//           const Icon(Icons.zoom_out_map),
//       ),
    );
  }
}

