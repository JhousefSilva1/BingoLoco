import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CardBingoApp());
}

class CardBingoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CardBingoAppScreen(),
    );
  }
}

class CardBingoAppScreen extends StatefulWidget {
  const CardBingoAppScreen({Key? key}) : super(key: key);

  @override
  _CardBingoAppScreenState createState() => _CardBingoAppScreenState();
}

class _CardBingoAppScreenState extends State<CardBingoAppScreen> {
  List<List<int?>> bingoCard = [];

  void generateBingoCard() {
    bingoCard = [];
    Random random = Random();
    List<int> selectedNumbers = [];
    int blankSpacesCount = 0;

    for (int i = 0; i < 3; i++) {
      List<int?> row = [];
      for (int j = 0; j < 10; j++) {
        int start = j * 10 + 1;
        int end = (j + 1) * 10;

        int? number;
        if (selectedNumbers.length < 90 && blankSpacesCount < 12) {
          if (random.nextDouble() < 0.5) {
            do {
              number = random.nextInt(end - start + 1) + start;
            } while (selectedNumbers.contains(number));
            selectedNumbers.add(number);
          } else {
            number = null;
            blankSpacesCount++;
          }
        } else if (selectedNumbers.length < 90) {
          do {
            number = random.nextInt(end - start + 1) + start;
          } while (selectedNumbers.contains(number));
          selectedNumbers.add(number);
        } else {
          number = null;
        }
        row.add(number);
      }
      bingoCard.add(row);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Carton Bingo',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF004070),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
              ),
              itemBuilder: (context, index) {
                int rowIndex = index ~/ 10;
                int columnIndex = index % 10;
                int? number = bingoCard[rowIndex][columnIndex];

                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: number != null
                        ? Text(
                            number.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Icon(Icons.sentiment_satisfied_alt),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateBingoCard,
              child: const Text('Generar cartón de bingo'),
            ),
          ],
        ),
      ),
    );
  }
}
