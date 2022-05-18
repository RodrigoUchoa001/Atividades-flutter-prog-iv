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
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rodrigo.jpg'),
                  radius: 55,
                ),
                const Text(
                  'Rodrigo Uchôa',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  width: 200.0,
                  height: 3.0,
                  color: Colors.white12,
                ),
                const BotaoContato(
                    formaDeContato: '+55 86 99513-8755', icone: Icons.call),
                const BotaoContato(
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
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   const SizedBox(width: 1),
        //   Icon(icone, color: Colors.teal),
        //   Text(
        //     telefone,
        //     style: const TextStyle(
        //         color: Colors.teal, fontSize: 17, fontWeight: FontWeight.bold),
        //   )
        // ],
        children: [
          Icon(icone, color: Colors.teal),
          Expanded(
            //COLOCA O TEXT EM TODO O ESPACO RESTANTE
            //NO CONTAINER
            child: Text(
              formaDeContato,
              textAlign: TextAlign.center,
              //CENTRALIZA O TEXTO NO ESPACO RESTANTE
              //DO CONTAINER GERADO PELO EXPANDED
              style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

