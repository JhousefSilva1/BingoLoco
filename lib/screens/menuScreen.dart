import 'package:bingo/screens/cardBingo.dart';
import 'package:bingo/screens/playBingoScreen.dart';
import 'package:bingo/screens/orderBingo.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Icon
            const Icon(
              Icons.casino,
              size: 200,
            ),
            const Text(
              'Bienvenidos al Bingo Loco',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF004070),
              ),
            ),
            const SizedBox(height: 24),

            //button to pllay Quieres Jugar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayBingoAppScreen()),
                );
              },
              child: const Text(
                'Quieres Jugar',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF004070),
                ),
              ),
            ),

            const SizedBox(height: 24),

            //buttom to show Settings screm
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsBingoApp()),
                );
              },
              child: const Text('Settings'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardBingoAppScreen()),
                );
              },
              child: const Text('Pide tu carton BingoLoco'),
            ),
          ],
        ),
      ),
    );
  }
}
