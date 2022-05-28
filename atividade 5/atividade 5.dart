// PRA FORCAR A TELA APENAS VERTICAL
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PRA FORCAR A TELA APENAS VERTICAL
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Meu aplicativo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
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
  //
  ///PRA CRIAR CADA TEXTO RECEBENDO A COR E TAMANHO, PRA N PRECISAR ESCREVER
  ///TUDO DE NOVO
  TextStyle criaTextoPadrao({required Color cor, required double tamanho}) {
    return TextStyle(
      fontFamily: 'Concert One',
      color: cor,
      fontSize: tamanho,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      //PRA DEIXAR A BARRA DE STATUS COM A COR DO APP,
      //O Q REMOVE O SAFE AREA
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset('assets/images/ball.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        'Volley',
                        style: criaTextoPadrao(cor: Colors.white, tamanho: 55),
                        // O METODO ACIMA É O MSM QUE:
                        // style: TextStyle(
                        //   fontFamily: 'Concert One',
                        //   color: Colors.white,
                        //   fontSize: 55,
                        // ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0, 10, 10, 0), //GAMBIARRA
                        child: Text(
                          'do fim de semana',
                          style:
                              criaTextoPadrao(cor: Colors.white, tamanho: 12),
                          // style: TextStyle(
                          //   fontFamily: 'Concert One',
                          //   color: Colors.white,
                          //   fontSize: 12,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      width: 270,
                      height: 85,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 4),
                        color: Colors.cyan[200],
                      ),
                      child: Text(
                        'TIMES',
                        textAlign: TextAlign.center,
                        style: criaTextoPadrao(cor: Colors.white, tamanho: 60),
                        // style: TextStyle(
                        //   fontFamily: 'Concert One',
                        //   color: Colors.white,
                        //   fontSize: 60,
                        // ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Jogador(nome: 'Sicranos', quantidade: 3),
                      Jogador(nome: 'Autoconvidados', quantidade: 3),
                      Jogador(nome: 'Ziraldos', quantidade: 4),
                      Jogador(nome: 'Sparrings', quantidade: 5),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Jogo Casado',
                    style: TextStyle(
                      fontFamily: 'Concert One',
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.fromLTRB(0, 10, 0, 30), //GAMBIARRA
                    margin: const EdgeInsets.symmetric(
                        //GAMBIARRA
                        horizontal: 10,
                        vertical: 40),
                    width: 280,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.indigo[600],
                    ),
                    child: Text(
                      'Iniciar',
                      textAlign: TextAlign.center,
                      style: criaTextoPadrao(cor: Colors.white, tamanho: 40),
                      // style: TextStyle(
                      //   fontFamily: 'Concert One',
                      //   color: Colors.white,
                      //   fontSize: 40,
                      // ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: printa,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18), //GAMBIARRA
            child: Text(
              '+',
              style: criaTextoPadrao(cor: Colors.white, tamanho: 40),
              // style: TextStyle(
              //   fontFamily: 'Concert One',
              //   color: Colors.white,
              //   fontSize: 40,
              // ),
            ),
          ),
        ),
      ),
    );
  }

  void printa() => debugPrint('sss');
}

class Jogador extends StatelessWidget {
  final String nome;
  final int quantidade;

  const Jogador({
    Key? key,
    required this.nome,
    required this.quantidade,
  }) : super(key: key);

  TextStyle criaTextoPadrao({required Color? cor, required double tamanho}) {
    return TextStyle(
      fontFamily: 'Concert One',
      color: cor,
      fontSize: tamanho,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        // textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              nome,
              style: criaTextoPadrao(cor: Colors.yellow, tamanho: 32),
              // style: const TextStyle(
              //   color: Colors.yellow,
              //   fontFamily: 'Concert One',
              //   fontSize: 32,
              // ),
            ),
          ),
          Text(
            '$quantidade',
            style: criaTextoPadrao(cor: Colors.indigo[700], tamanho: 60),
            // style: TextStyle(
            //   color: Colors.indigo[700],
            //   fontFamily: 'Concert One',
            //   fontSize: 60,
            // ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'jogadores',
              style: criaTextoPadrao(cor: Colors.indigo[700], tamanho: 12),
              // style: TextStyle(
              //   color: Colors.indigo[700],
              //   fontFamily: 'Concert One',
              //   fontSize: 12,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

