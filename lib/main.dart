import 'package:bingo/screens/menuScreen.dart';
import 'package:bingo/screens/playBingoScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        'play': (context) => PlayBingoApp(),
      },
    );
  }
}
