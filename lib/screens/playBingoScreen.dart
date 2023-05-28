import 'dart:math';
import 'package:flutter/material.dart';

class TempDataProvider {
  static final TempDataProvider _instance = TempDataProvider._internal();

  factory TempDataProvider() {
    return _instance;
  }

  TempDataProvider._internal();

  int numeroAleatorio = 0;
  Set<int> numerosGenerados = <int>{};
  Set<int> numerosGeneradosUnique = <int>{};
  List uniquelist = [];
}

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
  TempDataProvider tempDataProvider = TempDataProvider();

  void generarNumerosAleatorios() {
    Random random = Random();
    int nuevoNumero;

    do {
      nuevoNumero = random.nextInt(99) + 1;
    } while (tempDataProvider.numerosGenerados.contains(nuevoNumero));

    setState(() {
      tempDataProvider.numeroAleatorio = nuevoNumero;
      tempDataProvider.numerosGenerados.add(nuevoNumero);
      tempDataProvider.numerosGenerados.add(nuevoNumero);
      var seen = Set();
      tempDataProvider.uniquelist =
          tempDataProvider.numerosGenerados.where((country) => seen.add(country)).toList();
      print(tempDataProvider.uniquelist);
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
                  tempDataProvider.numeroAleatorio != null
                      ? tempDataProvider.numeroAleatorio.toString()
                      : 'Presiona el botón',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                shrinkWrap: true,
                itemCount: tempDataProvider.uniquelist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(
                        Random().nextInt(255),
                        Random().nextInt(255),
                        Random().nextInt(255),
                        1,
                      ),
                      child: Text(
                        tempDataProvider.uniquelist[index].toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(onPressed: () => search(5), child: Text('buscar')),
            ],
          ),
        ),
      ),
    );
  }

  search(int index) {
    // Implementa la lógica para buscar en tempDataProvider
  }
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
