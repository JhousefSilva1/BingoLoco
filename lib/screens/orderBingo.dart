// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, unused_import

import 'package:bingo/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SettingsBingoApp());
}

class SettingsBingoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SettingsBingoAppScreen(),
    );
  }
}

class SettingsBingoAppScreen extends StatefulWidget {
  const SettingsBingoAppScreen({Key? key}) : super(key: key);

  @override
  _SettingsBingoAppScreenState createState() => _SettingsBingoAppScreenState();
}

class _SettingsBingoAppScreenState extends State<SettingsBingoAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
