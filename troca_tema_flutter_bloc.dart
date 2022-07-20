import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => TemasCubit(),
      child: const MeuApp(),
    )
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemasCubit, ThemeData?>(
        builder: (context, tema) {
          return MaterialApp(
            theme: tema,
            home: const MyHomePage(),
          );
        },
      );
  }
}


class TemasCubit extends Cubit<ThemeData?>{
  static ThemeData? temaEscuro = ThemeData.dark().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.red
    )
  );
  static ThemeData? temaClaro = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green
    )
  );

  TemasCubit(): super(temaEscuro);

  void usarTemaClaro() => emit(temaClaro);
  void usarTemaEscuro() => emit(temaEscuro);

  void trocaTema(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      usarTemaEscuro();
    } else {
      usarTemaClaro();
    }
  }
}


// class MeuApp extends StatelessWidget {
//   const MeuApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
        
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('dfklghkdlf'),
              const SizedBox(height: 20),
              IconButton(
                onPressed: () => context.read<TemasCubit>().trocaTema(context),
                icon: const Icon(Icons.swap_calls)
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.light_mode),
            onPressed: () => context.read<TemasCubit>().usarTemaClaro(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.dark_mode),
            onPressed: () => context.read<TemasCubit>().usarTemaEscuro(),
          ),
        ],
      ),      
    );
  }
}