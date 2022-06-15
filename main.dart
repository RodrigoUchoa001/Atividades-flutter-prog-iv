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
  int valorPeso = 59, valorIdade = 22, altura = 150;

  // BotoesMaisMenos peso = BotoesMaisMenos(nome: 'Peso', numero: valorPeso);
  // BotoesMaisMenos idade = BotoesMaisMenos(nome: 'Idade', numero: valorIdade);
  MeuSlider sliderAltura = MeuSlider();

  String calculaIMC() {
    // double alturaEmMetro = ((sliderAltura.getNumero) / 100);
    // debugPrint('valores: Peso: ${peso.getNumero}, Altura: $alturaEmMetro');
    // return (valorPeso / (alturaEmMetro * alturaEmMetro)).toStringAsFixed(2);
    return '$valorPeso e $valorIdade';
  }

  Color _corMasculino = Colors.black;
  Color _corFeminino = corDeFundoUnpressed;

  void alteraCoresSexo(bool masculino){
    // var aux= _corFeminino;
    if (masculino){
      _corMasculino = Colors.black;
      _corFeminino = corDeFundoUnpressed;      
    }else{
      _corMasculino = corDeFundoUnpressed;
      _corFeminino = Colors.black;
    }

    // _corFeminino = _corMasculino;
    // _corMasculino = aux;

    // _corMasculino = _corMasculino == Colors.black? Colors.grey: Colors.black;
    // _corFeminino = _corFeminino == Colors.black? Colors.grey: Colors.black;

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
                Bloco(
                  corDeFundo: _corMasculino,
                  conteudo: GestureDetector(
                    onTap: () {
                      setState(() {
                        alteraCoresSexo(true);
                      });
                    },
                    child:  BotaoSexo(
                        icone: Icons.male,
                        nome: 'masculino',
                      ),
                    ),
                ),
                
                Bloco(
                  corDeFundo: _corFeminino,
                  conteudo: GestureDetector(
                    onTap: (() {
                      setState(() {                   
                        alteraCoresSexo(false);
                      });
                    }),
                    child: BotaoSexo(
                      icone: Icons.female,
                      nome: 'feminino',
                    ),
                  ),
                ),
              ],
            ),
            Bloco(conteudo: sliderAltura),
            Row(
              children: [
                Bloco(conteudo: BotoesMaisMenos(
                  nome: 'Peso', 
                  numero: valorPeso,
                  incrementar: (){
                    setState(() {
                      valorPeso++;
                    });
                    }, 
                  decrementar: () {
                    setState(() {
                      valorPeso--;
                    });
                  },
                  ),
                  ),
                Bloco(conteudo: BotoesMaisMenos(nome: 'Idade', numero: valorIdade, 
                  decrementar: () {
                    setState(() {
                      valorIdade++;
                    });}, 
                  incrementar: () {
                    setState(() {
                      valorIdade--;
                    })
                  ;}
                ,)
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
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
  BotaoSexo(
      {Key? key,
      required this.icone,
      required this.nome,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      )
    ;
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
  // final void Function() respostaAoToque;
  Color corDeFundo = corDeFundoPressed;

  Bloco({
    Key? key,
    required this.conteudo, this.corDeFundo=const Color(0xFF1d1e30), 
    // required this.respostaAoToque,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: corDeFundo,
        ),
        height: 200,
        child: conteudo,
      ),
    );
  }
}

class BotoesMaisMenos extends StatefulWidget {
  final String nome;
  int numero;
  final void Function() incrementar;
  final void Function() decrementar;
  BotoesMaisMenos({Key? key, required this.nome, required this.numero, required this.incrementar, required this.decrementar})
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
                    widget.decrementar;
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
                    widget.incrementar;
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
            text: '${(widget._numero).ceil()}',
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
          divisions: 200,
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