import 'dart:math';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dicee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Icon> resultado = [];

  List<Pergunta> perguntas = [
    Pergunta('pergunta1', true),
    Pergunta('pergunta2', true),
    Pergunta('pergunta3', true),
    Pergunta('pergunta4', true),
    Pergunta('pergunta5', true),
  ];

  int contador=0;
  void incrementa(){
    if (contador==perguntas.length-1){
      resultado.clear();
      contador=0;      
    }
    else{
      contador++;
    }
  }

  void verificaResposta(bool respostaDoBotao){
    if (perguntas[contador].resposta == respostaDoBotao){
      setState(() {        
        incrementa();
        resultado.add(const Icon(Icons.check, color: Colors.green,));
      });
    }
    else{
      setState(() {
        incrementa();
        resultado.add(const Icon(Icons.close, color: Colors.red,));
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF262626),      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: Text(
                perguntas[contador].pergunta, 
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 70,
            child: Botao(
              titulo: 'true', 
              cor: Colors.green,
              onTap: () => verificaResposta(true),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 70,
            child: Botao(
              titulo: 'false', 
              cor: Colors.red,
              onTap: () => verificaResposta(false),
            ),
          ),

          Row(
            children: resultado
          ,)
        ]
      ,)
    );
  }
}

class Botao extends StatelessWidget {
  final String titulo;
  final Color cor;
  final void Function() onTap;
  const Botao({ Key? key, required this.titulo, required this.cor, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onTap, 
              style: ElevatedButton.styleFrom(
                primary: cor,
              ),
              child: Text(titulo)
            ),
          ),
        );
  }
}

class Pergunta{
  String pergunta;
  bool resposta;

  Pergunta(this.pergunta, this.resposta);
}