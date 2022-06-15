import 'package:flutter/material.dart';

void main() {
  // widget
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// 0 = limpo; 1= para X;  2= para O;
  late List<int> jogo;
  int vezDeQuem = 0;
  String mensagem = 'Jogo rolando';
  int jogadas = 0;
  bool acabou = false;

  int getVezDeQuem() {
    vezDeQuem = vezDeQuem == 1 ? 2 : 1;
    return vezDeQuem;
  }

  @override
  void initState() {
    jogo = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    super.initState();
  }

  // void mudarEstadoNumTapa(int posicao) {
  //   setState(() {
  //     jogo[posicao] = 1;
  //   });
  //   debugPrint(jogo.toString());
  // }

  void fazJogada(int posicao) {
    // TESTA SE O JOGO AINDA N ACABOU
    if (acabou) return;

    // TESTA SE JA NÃO HA JOGADA NESSA POSICAO
    if (jogo[posicao] != 0) return;

    jogo[posicao] = getVezDeQuem();
    jogadas++;

    // TESTA SE TODAS AS POSICOES JA FORAM PREENCHIDAS
    if (!jogo.contains(0)) {
      mensagem = 'Empate';
    }
    debugPrint('$jogadas');
  }

  void verificaGanhador() {
    // LINHAS
    // VENCEU NA PRIMEIRA LINHA
    if (jogo[0] == jogo[1] &&
        jogo[1] == jogo[2] &&
        jogo[0] == jogo[2] &&
        jogo[0] != 0) {
      debugPrint("venceu 1 linha");
      setVencedor(jogo[0]);
    }
    // VENCEU NA SEGUNDA LINHA
    else if (jogo[3] == jogo[4] &&
        jogo[4] == jogo[5] &&
        jogo[3] == jogo[5] &&
        jogo[3] != 0) {
      debugPrint("venceu 2 linha");
      setVencedor(jogo[3]);
    }
    // VENCEU NA TERCEIRA LINHA
    else if (jogo[6] == jogo[7] &&
        jogo[7] == jogo[8] &&
        jogo[6] == jogo[8] &&
        jogo[6] != 0) {
      debugPrint("venceu 3 linha");
      setVencedor(jogo[6]);
    }
    // COLUNAS
    //VENCEU NA PRIMEIRA COLUNA
    else if (jogo[0] == jogo[3] &&
        jogo[0] == jogo[6] &&
        jogo[0] == jogo[6] &&
        jogo[0] != 0) {
      debugPrint("venceu 1 coluna");
      setVencedor(jogo[0]);
    }
    //VENCEU NA SEGUNDA COLUNA
    else if (jogo[1] == jogo[4] &&
        jogo[4] == jogo[7] &&
        jogo[1] == jogo[7] &&
        jogo[1] != 0) {
      debugPrint("venceu 2 coluna");
      setVencedor(jogo[1]);
    }
    //VENCEU NA TERCEIRA COLUNA
    else if (jogo[2] == jogo[5] &&
        jogo[5] == jogo[8] &&
        jogo[2] == jogo[8] &&
        jogo[2] != 0) {
      debugPrint("venceu 3 coluna");
      setVencedor(jogo[2]);
    }
    // LATERAIS
    // LATERAL CIMA-ESQUERDA
    else if (jogo[0] == jogo[4] &&
        jogo[4] == jogo[8] &&
        jogo[0] == jogo[8] &&
        jogo[0] != 0) {
      debugPrint("venceu LATERAL CIMA-ESQUERDA");
      setVencedor(jogo[0]);
    }
    // LATERAL CIMA-DIREITA
    else if (jogo[2] == jogo[4] &&
        jogo[4] == jogo[6] &&
        jogo[2] == jogo[6] &&
        jogo[2] != 0) {
      debugPrint("venceu LATERAL CIMA-DIREITA");
      setVencedor(jogo[2]);
    }
  }

  void setVencedor(int numero) {
    if (numero == 1) {
      mensagem = 'X venceu';
      acabou = true;
    } else {
      mensagem = 'O venceu';
      acabou = true;
    }
  }

  void resetaJogo() {
    jogo = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    jogadas = 0;
    mensagem = 'jogo rolando';
    acabou = false;
    vezDeQuem = 0;
  }

  // void mudarEstadoEmDoisTapa(int posicao) {
  //   setState(() {
  //     jogo[posicao] = 2;
  //   });
  //   debugPrint(jogo.toString());
  // }

  // Widget solucaoDebora = GridView.count(
  //   primary: false,
  //   padding: const EdgeInsets.all(20),
  //   crossAxisSpacing: 10,
  //   mainAxisSpacing: 10,
  //   crossAxisCount: 3,
  //   children: [
  //     Area(
  //       valor: jogo[0],
  //       numTapa: () => mudarEstadoNumTapa(0),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(0),
  //     ),
  //     Area(
  //       valor: jogo[1],
  //       numTapa: () => mudarEstadoNumTapa(1),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(1),
  //     ),
  //     Area(
  //       valor: jogo[2],
  //       numTapa: () => mudarEstadoNumTapa(2),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(2),
  //     ),
  //     Area(
  //       valor: jogo[3],
  //       numTapa: () => mudarEstadoNumTapa(3),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(3),
  //     ),
  //     Area(
  //       valor: jogo[4],
  //       numTapa: () => mudarEstadoNumTapa(4),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(4),
  //     ),
  //     Area(
  //       valor: jogo[5],
  //       numTapa: () => mudarEstadoNumTapa(5),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(5),
  //     ),
  //     Area(
  //       valor: jogo[6],
  //       numTapa: () => mudarEstadoNumTapa(6),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(6),
  //     ),
  //     Area(
  //       valor: jogo[7],
  //       numTapa: () => mudarEstadoNumTapa(7),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(7),
  //     ),
  //     Area(
  //       valor: jogo[8],
  //       numTapa: () => mudarEstadoNumTapa(8),
  //       emDoisTapa: () => mudarEstadoEmDoisTapa(8),
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: jogo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, posicao) => Area(
                      valor: jogo[posicao],
                      numTapa: () {
                        setState(() {
                          fazJogada(posicao);
                          verificaGanhador();
                        });
                      },
                    ),
                  ),
                ),
              ),
              Text(mensagem),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resetaJogo();
                  });
                  debugPrint('clique no botaum de reiniciar');
                },
                child: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef FuncaoRetornoAosTapa = void Function();

class Area extends StatelessWidget {
  final int valor;
  FuncaoRetornoAosTapa numTapa;
  // FuncaoRetornoAosTapa emDoisTapa;

  Area({
    Key? key,
    required this.valor,
    required this.numTapa,
    // required this.emDoisTapa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: numTapa,
      // onDoubleTap: emDoisTapa,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey[600],
        child: Center(
          child: Text(
            valor == 0
                ? ''
                : valor == 1
                    ? 'X'
                    : '0',
            style: const TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

