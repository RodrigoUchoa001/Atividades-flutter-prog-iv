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
  BotoesMaisMenos peso = BotoesMaisMenos(nome: 'Peso', numero: 59);
  BotoesMaisMenos idade = BotoesMaisMenos(nome: 'Idade', numero: 22);
  MeuSlider SliderAltura = MeuSlider();

  double calculaIMC() {
    double alturaEmMetro = SliderAltura.getNumero / 100;
    debugPrint('valores: Peso: ${peso.getNumero}, Altura: $alturaEmMetro');
    return (peso.getNumero / (alturaEmMetro * alturaEmMetro));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      //PRA DEIXAR A BARRA DE STATUS COM A COR DO APP,
      //O Q REMOVE O SAFE AREA
      child: Scaffold(
        backgroundColor: corDeFundo,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Calculadora de IMC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                BotaoSexo(
                  icone: Icons.male,
                  nome: 'masculino',
                  corDeFundo: corDeFundoPressed,
                ),
                BotaoSexo(
                  icone: Icons.female,
                  nome: 'feminino',
                  corDeFundo: corDeFundoUnpressed,
                ),
              ],
            ),
            Bloco(conteudo: SliderAltura),
            Row(
              children: [
                Bloco(conteudo: peso),
                Bloco(conteudo: idade),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('IMC: ${calculaIMC()}');
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  primary: const Color(0xffeb1555)),
              child: Text(
                'CALCULAR',
                style: criaTextoPadrao(cor: Colors.white, tamanho: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BotaoSexo extends StatelessWidget {
  final IconData icone;
  final String nome;
  late Color corDeFundo;
  BotaoSexo(
      {Key? key,
      required this.icone,
      required this.nome,
      required this.corDeFundo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bloco(
      conteudo: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icone,
            color: Colors.white,
            size: 90,
          ),
          Text(
            nome.toUpperCase(),
            style: criaTextoPadrao(cor: Colors.white70, tamanho: 20),
          ),
        ],
      ),
    );
  }
}

//
///PRA CRIAR CADA TEXTO RECEBENDO A COR E TAMANHO, PRA N PRECISAR ESCREVER
///TUDO DE NOVO
TextStyle criaTextoPadrao(
    {required Color cor, required double tamanho, bool negrito = false}) {
  return TextStyle(
    color: cor,
    fontSize: tamanho,
    fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
  );
}

Color corDeFundo = const Color(0xFF0a0e21);
Color corDeFundoPressed = const Color.fromARGB(255, 9, 10, 22);
Color corDeFundoUnpressed = const Color(0xFF1d1e30);

class Bloco extends StatelessWidget {
  final Widget conteudo;
  const Bloco({
    Key? key,
    required this.conteudo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: corDeFundoUnpressed,
          ),
          height: 200,
          child: conteudo,
        ),
      ),
    );
  }
}

class BotoesMaisMenos extends StatefulWidget {
  final String nome;
  late int numero;
  BotoesMaisMenos({Key? key, required this.nome, required this.numero})
      : super(key: key);

  int get getNumero {
    return numero;
  }

  @override
  State<BotoesMaisMenos> createState() => _BotoesMaisMenosState();
}

class _BotoesMaisMenosState extends State<BotoesMaisMenos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.nome.toUpperCase(),
          style: criaTextoPadrao(cor: Colors.white70, tamanho: 20),
        ),
        Text(
          '${widget.numero}',
          style: criaTextoPadrao(cor: Colors.white, tamanho: 50, negrito: true),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF4C4F5E),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 40,
                onPressed: () {
                  debugPrint('botaomenos');
                  setState(() {
                    widget.numero--;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF4C4F5E),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 40,
                onPressed: () {
                  debugPrint('botaomais');
                  setState(() {
                    widget.numero++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MeuSlider extends StatefulWidget {
  double _numero = 150;

  MeuSlider({Key? key}) : super(key: key);

  double get getNumero {
    return _numero;
  }

  @override
  State<MeuSlider> createState() => _MeuSliderState();
}

class _MeuSliderState extends State<MeuSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Altura'.toUpperCase(),
          style: criaTextoPadrao(cor: Colors.white70, tamanho: 20),
        ),
        RichText(
          text: TextSpan(
            text: '${(widget._numero).round()}',
            style:
                criaTextoPadrao(cor: Colors.white, tamanho: 50, negrito: true),
            children: [
              TextSpan(
                text: ' cm',
                style: criaTextoPadrao(cor: Colors.white70, tamanho: 20),
              ),
            ],
          ),
        ),
        Slider(
          value: widget._numero,
          min: 50,
          max: 250,
          inactiveColor: const Color(0xff8d8998),
          activeColor: Colors.white,
          thumbColor: const Color(0xffeb1555),
          onChanged: (double value) {
            setState(() {
              widget._numero = value;
            });
          },
        ),
      ],
    );
  }
}

