// PRA FORCAR A TELA APENAS VERTICAL
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

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
      home: PaginaDois(),
    );
  }
}


class PaginaInicial extends StatelessWidget {
  const PaginaInicial({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Dio().get('https://catfact.ninja/fact'), 
        builder: (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasData){
            Response? resposta = snapshot.data;

            // SE DEU BOM O RESULTADO
            if (resposta?.statusCode==200){
              FatoDeGato f = FatoDeGato.fromJson(resposta?.data);
              // SE DEU BOM, RETORNA O RESULTADO
              return Center(
                child: Text(
                  'FATO GERADO:\n${f.fact!}', 
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            // SE DEU RUIM O RESULTADO
            }else{
              return Text('${resposta?.statusMessage}');
            }

          }else if (snapshot.hasError){
            return Text('DEU ERRO: ${snapshot.error}');
          }
          // ANIMACAO DE CARREGAMENTO ENQUANTO ESPERA CHEGAR
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        },
      ),
    );
  }
}

class PaginaDois extends StatelessWidget {
  PaginaDois({ Key? key }) : super(key: key);

  final tradutor = GoogleTranslator();

  Text retornaTexto(String? texto){
    return Text(
        'Uma frase do Kanye West:\n$texto',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Dio().get('https://api.kanye.rest/'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData){
            Response? resposta = snapshot.data;

            if (resposta?.statusCode==200){
              FalaDoKenyeWest fala = FalaDoKenyeWest.fromJson(resposta?.data);

              return Center(
                child: retornaTexto(fala.quote),
              );

            }else{
              return Text('${resposta?.statusMessage}');
            }
          }
          else if (snapshot.hasError){
              return Text('DEU ERRO: ${snapshot.error}');
          }

          return const CircularProgressIndicator();

        },),      
    );
  }
}

// FatoDeGato.fromJson(Map<String,dynamic> json){
//  fato = json['fact'];
//  tamanho = json['length'];
// }

// class FatoDeGato{
//   String? fato;
//   int? tamanho;

//   // deserializacao do JSON
//   FatoDeGato.fromJson(Map<String,dynamic> json){
//     fato = json['fact'];
//     tamanho = json['length'];
//   }
// }

// LINK PRA CONVERTER DE JSON PRA CLASSE DART:
// https://javiercbk.github.io/json_to_dart/
// MODELS: CLASSES Q REPRESENTAM O JSON RECEBIDO CRIADO NO SITE Q EU FALEI ANTES
// repositories: QUEM FAZ A REQUISIÇAO
// Ui: LAYOUT
class FatoDeGato {
  String? fact;
  int? length;

  FatoDeGato({this.fact, this.length});

  FatoDeGato.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fact'] = fact;
    data['length'] = length;
    return data;
  }
}

// NOVO EXEMPLO 
class FalaDoKenyeWest {
  String? quote;

  FalaDoKenyeWest({this.quote});

  FalaDoKenyeWest.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['quote'] = quote;
    return data;
  }
}
