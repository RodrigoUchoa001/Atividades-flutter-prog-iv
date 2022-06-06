// PRA FORCAR A TELA APENAS VERTICAL
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      //PRA DEIXAR A BARRA DE STATUS COM A COR DO APP,
      //O Q REMOVE O SAFE AREA
      child: Scaffold(
        body: Column(
          children: [
            NotaDoXilofone(cor: Colors.red, notaMusical: '1'),
            NotaDoXilofone(cor: Colors.orange, notaMusical: '2'),
            NotaDoXilofone(cor: Colors.yellow, notaMusical: '3'),
            NotaDoXilofone(cor: Colors.green, notaMusical: '4'),
            NotaDoXilofone(cor: Colors.teal, notaMusical: '5'),
            NotaDoXilofone(cor: Colors.blue, notaMusical: '6'),
            NotaDoXilofone(cor: Colors.purple, notaMusical: '7'),
          ],
        ),
      ),
    );
  }
}

class NotaDoXilofone extends StatelessWidget {
  final Color cor;
  final String notaMusical;
  NotaDoXilofone({Key? key, required this.cor, required this.notaMusical})
      : super(key: key);

  // final AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache audioCache = AudioCache();

  void tocarNotaMusical() async {
    debugPrint('tocando note$notaMusical.wav');

    // FUNCIONANDO DE UM JEITO Q ENTENDI PORRA NENHUMA
    // String audioAsset = 'assets/sounds/note$notaMusical.wav';
    // ByteData bytes = await rootBundle.load(audioAsset);
    // Uint8List soundBytes = bytes.buffer.asUint8List(
    //   bytes.offsetInBytes,
    //   bytes.lengthInBytes,
    // );
    // int result = await audio.playBytes(soundBytes);
    // if (result == 1) {
    //   debugPrint('deu bom, tocando note$notaMusical.wav');
    // } else {
    //   debugPrint('deu ruim');
    // }

    // USANDO EXEMPLO DA DOCUMENTACAO
    // final arquivo = await audioCache.loadAsFile('sounds/note$notaMusical.wav');
    // final bytes = await arquivo.readAsBytes();
    // audioCache.playBytes(bytes);

    // OUTRO EXEMPLO DA DOCUMENTAÇÃO, MAIS SIMPLES
    audioCache.play('sounds/note$notaMusical.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: tocarNotaMusical,
        child: Container(
          color: cor,
        ),
      ),
    );
  }
}

