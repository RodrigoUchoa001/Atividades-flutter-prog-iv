import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu aplicativo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaginaInicial(titulo: 'Meu aplicativo'),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  final String titulo;
  const PaginaInicial({Key? key, required this.titulo}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _MinhaPaginaInicial();
}

class _MinhaPaginaInicial extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 80,
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  'botao 1',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
                child: const Center(
                    child: Text(
                  'B',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.purple,
                child: const Center(
                    child: Text(
                  'A',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 80,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'C',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.pink,
                child: const Center(
                    child: Text(
                  'Aperta aqui',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

