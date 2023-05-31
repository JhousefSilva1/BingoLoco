// ignore_for_file: prefer_const_constructors

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
  List<List<int?>> bingoCard = [];
  List uniquelist = [];
  ListaEnlazada lista = ListaEnlazada();
}

class PlayBingoAppScreen extends StatefulWidget {
  const PlayBingoAppScreen({Key? key}) : super(key: key);

  @override
  _PlayBingoAppScreenState createState() => _PlayBingoAppScreenState();
}

class _PlayBingoAppScreenState extends State<PlayBingoAppScreen> {
  final TextEditingController _searchController = TextEditingController();
  // ListaEnlazada lista = ListaEnlazada();
  bool? isSearch;

  @override
  void initState() {
    generateBingoCard();
    super.initState();
  }

  void _search() {
    String searchText = _searchController.text;
    setState(() {
      isSearch = tempDataProvider.lista.buscar(int.parse(searchText));      
    });
  }

  void generateBingoCard({bool isNew = false}) {
    if(isNew) tempDataProvider.bingoCard = [];
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
      tempDataProvider.bingoCard.add(row);
    }
    setState(() {});
  }

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
      tempDataProvider.uniquelist = tempDataProvider.numerosGenerados
          .where((country) => seen.add(country))
          .toList();
      print(tempDataProvider.uniquelist);
      tempDataProvider.lista.insertar(nuevoNumero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: const Text(
                                'Mi Carton Bingo',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Color(0xFF004070),
                                ),
                              ),
                            ), 
                          ),
                          ElevatedButton(
                            onPressed: () => generateBingoCard(isNew: true),
                            child: const Text('Nuevo cartón'),
                          ),
                        ],
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
                          int? number = tempDataProvider.bingoCard[rowIndex][columnIndex];
                          
      
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Center(
                              child: number != null
                                  ? GestureDetector(
                                    onTap: () {
                                      print(number);
                                    },
                                    child: Text(
                                        number.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  )
                                  : const Icon(Icons.sentiment_satisfied_alt),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: generateBingoCard,
                      //   child: const Text('Generar cartón de bingo'),
                      // ),
                    ],
                  ),
                ),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Buscar',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _search,
                    ),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10),
                if(isSearch != null)Text(isSearch == true? 'Salio el numero: ${_searchController.text}': 'No salio el numero: ${_searchController.text}'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: generarNumerosAleatorios,
                      child: Icon(Icons.generating_tokens),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        tempDataProvider.numeroAleatorio != null
                            ? tempDataProvider.numeroAleatorio.toString()
                            : 'Presiona el botón',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                    
                  ],
                ),
                
                GridView.builder(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                // ElevatedButton(onPressed: () => search, child: Text('buscar')),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => CardBingoAppScreen()),
                //     );
                //   },
                //   child: Text('Ver Carton'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  search(int index) {
    if (tempDataProvider.uniquelist.length > 0) {
      setState(() {
        tempDataProvider.numeroAleatorio = tempDataProvider.uniquelist[index];
      });
    }
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

class Nodo {
  dynamic valor;
  Nodo? siguiente;

  Nodo(this.valor, {this.siguiente});
}

class ListaEnlazada {
  Nodo? cabeza;

  void insertar(dynamic valor) {
    if (cabeza == null) {
      cabeza = Nodo(valor);
    } else {
      Nodo nuevoNodo = Nodo(valor, siguiente: cabeza);
      cabeza = nuevoNodo;
    }
  }

  bool buscar(dynamic valor) {
    Nodo? actual = cabeza;

    while (actual != null) {
      if (actual.valor == valor) {
        return true; // El valor se encontró en la lista enlazada
      }
      actual = actual.siguiente;
    }

    return false; // El valor no se encontró en la lista enlazada
  }
}