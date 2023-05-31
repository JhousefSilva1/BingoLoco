import 'package:bingo/screens/cardBingo.dart';
import 'package:bingo/screens/menuScreen.dart';
import 'package:bingo/screens/playBingoScreen.dart';
import 'package:bingo/screens/orderBingo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MenuApp());
}

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        'play': (context) => PlayBingoApp(),
        'settings': (context) => SettingsBingoApp(),
        'cardBingo': (context) => CardBingoAppScreen(),
      },
    );
  }
}
