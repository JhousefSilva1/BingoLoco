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
  int numeroAleatorio = 0;
  Set<int> numerosGenerados = <int>{};
  Set<int> numerosGeneradosUnique = <int>{};
  List uniquelist = [];

  void generarNumerosAleatorios() {
    Random random = Random();
    int nuevoNumero;

    do {
      nuevoNumero = random.nextInt(99) + 1;
    } while (numerosGenerados.contains(nuevoNumero));

    setState(() {
      numeroAleatorio = nuevoNumero;
      numerosGenerados.add(nuevoNumero);
      numerosGenerados.add(nuevoNumero);
      var seen = Set();
      uniquelist =
          numerosGenerados.where((country) => seen.add(country)).toList();
      print(uniquelist);
    });
  }

  @override
  Widget build(BuildContext context) {
    var tree = TreeNode(
      'Root',
      [
        TreeNode('Child 1', [
          TreeNode('Grandchild 1'),
          TreeNode('Grandchild 2'),
        ]),
        TreeNode('Child 2'),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
      ),
      body: SizedBox(
        child: Center(
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
                  numeroAleatorio != null
                      ? numeroAleatorio.toString()
                      : 'Presiona el botón',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: uniquelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(Random().nextInt(255),
                              Random().nextInt(255), Random().nextInt(255), 1),
                          child: Text(uniquelist[index].toString(),
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                      ],
                    );
                  }),
              ElevatedButton(onPressed: search(5), child: Text('buscar'))
            ],
          ),
        ),
      ),
    );
  }

  search(int index) {}
}

class TreeNode {
  final String value;
  final List<TreeNode> children;

  TreeNode(this.value, [this.children = const []]);
}

class TreeWidget extends StatelessWidget {
  final TreeNode rootNode;

  TreeWidget(this.rootNode);

  Widget _buildTree(TreeNode node) {
    return Column(
      children: [
        ListTile(
          title: Text(node.value),
        ),
        if (node.children.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                for (var child in node.children) _buildTree(child),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [_buildTree(rootNode)],
    );
  }
}
