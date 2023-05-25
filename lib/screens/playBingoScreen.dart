// ignore_for_file: unnecessary_const, prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison

import 'dart:math';

import 'package:bingo/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PlayBingoApp());
}

class PlayBingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlayBingoAppScreen(),
    );
  }
}

class PlayBingoAppScreen extends StatefulWidget {
  const PlayBingoAppScreen({Key? key}) : super(key: key);

  @override
  _PlayBingoAppScreenState createState() => _PlayBingoAppScreenState();
}

class _PlayBingoAppScreenState extends State<PlayBingoAppScreen> {
   int numeroAleatorio=0;
  List<int> numerosGenerados = [];

  void generarNumerosAleatorios() {
    Random random = Random();
    int nuevoNumero;

    do {
      nuevoNumero = random.nextInt(99) + 1;
    } while (numerosGenerados.contains(nuevoNumero));

    setState(() {
      numeroAleatorio = nuevoNumero;
      numerosGenerados.add(nuevoNumero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
      ),
      body:  Center(
        child: Column(
          children: <Widget>[
            const Icon(
              Icons.casino_outlined,
              size: 200,
            ),
            ElevatedButton(
              onPressed: generarNumerosAleatorios,
              child: Icon(Icons.refresh),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                numeroAleatorio != null ? numeroAleatorio.toString() : 'Presiona el botón',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
          
          
        ),
        
      ),
      
    );
  }
}
