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
    return SafeArea(
      top: false,
      //PRA DEIXAR A BARRA DE STATUS COM A COR DO APP,
      //O Q REMOVE O SAFE AREA
      child: Scaffold(
        body: Container(
          color: Colors.teal,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rodrigo.jpg'),
                  radius: 55,
                ),
                Text(
                  'Rodrigo Uchôa',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
                Divider(
                  height: 30.0,
                  color: Colors.white24,
                  indent: 90.0,
                  endIndent: 90.0,
                  thickness: 2.0,
                ),
                BotaoContato(
                    formaDeContato: '+55 86 99513-8755', icone: Icons.call),
                BotaoContato(
                    formaDeContato: 'rodrigo@aluno.uespi.br',
                    icone: Icons.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BotaoContato extends StatelessWidget {
  final String formaDeContato;
  final IconData icone;

  const BotaoContato(
      {Key? key, required this.formaDeContato, required this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        //PRA DAR UM EFEITO AO APERTAR O BOTAO
        child: InkWell(
          splashColor: Colors.teal.withAlpha(50),
          onTap: () {
            debugPrint('apertou');
          },
          child: ListTile(
            leading: Icon(icone, color: Colors.teal),
            title: Text(
              formaDeContato,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

