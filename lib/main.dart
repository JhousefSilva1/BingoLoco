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
        'play': (context) => const PlayBingoAppScreen(),
        'settings': (context) => SettingsBingoApp(),
        'cardBingo': (context) => const CardBingoAppScreen(),
      },
    );
  }
}



// // import 'package:bingo/screens/menuScreen.dart';
// // import 'package:bingo/screens/playBingoScreen.dart';
// // import 'package:bingo/screens/settingsBingo.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MenuApp());
// // }

// // class MenuApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Bingo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
// //         useMaterial3: true,
// //       ),
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => MenuScreen(),
// //         'play': (context) => PlayBingoApp(),
// //         'settings': (context) => SettingsBingoApp(),
// //       },
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {

// //   List<TreeNode> treeData = [
// //   TreeNode(
// //     name: 'Nodo 1',
// //     children: [
// //       TreeNode(name: 'Nodo 1.1'),
// //       TreeNode(
// //         name: 'Nodo 1.2',
// //         children: [
// //           TreeNode(name: 'Nodo 1.2.1'),
// //           TreeNode(name: 'Nodo 1.2.2'),
// //           TreeNode(
// //             name: 'Nodo 1.2.1',
// //             children: [
// //               TreeNode(name: 'Nodo 1.2.1.1'),
// //               TreeNode(name: 'Nodo 1.2.1.2'),
// //               TreeNode(name: 'Nodo 1.2.1.3'),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ],
// //   ),
// //   TreeNode(
// //     name: 'Nodo 2',
// //     children: [
// //       TreeNode(name: 'Nodo 2.1'),
// //       TreeNode(name: 'Nodo 2.2'),
// //     ],
// //   ),
// //   TreeNode(
// //     name: 'Nodo 3',
// //     children: [
// //       TreeNode(name: 'Nodo 3.1'),
// //       TreeNode(name: 'Nodo 3.2'),
// //     ],
// //   ),
// // ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Árbol'),
// //           actions: [
// //             IconButton(
// //               icon: Icon(Icons.search),
// //               onPressed: () {
// //                 final aux = showSearch(
// //                   context: context,
// //                   delegate: TreeSearchDelegate(treeData: treeData),
// //                   query: 'Nodo 1'
// //                 );
// //                 print(aux);
// //               },
// //             ),
// //           ],
// //         ),
// //         body: TreeView(data: treeData),
// //       ),
// //     );
// //   }
// // }

// // class TreeNode {
// //   String name;
// //   List<TreeNode> children;

// //   TreeNode({required this.name, this.children = const []});
// // }

// // class TreeView extends StatelessWidget {
// //   final List<TreeNode> data;

// //   const TreeView({required this.data});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       shrinkWrap: true,
// //       itemCount: data.length,
// //       itemBuilder: (context, index) {
// //         final node = data[index];
// //         return ListTile(
// //           title: Text(node.name),
// //           onTap: () {
// //             // Acción cuando se toca un elemento del árbol
// //           },
// //           subtitle: node.children.isNotEmpty
// //               ? TreeView(data: node.children)
// //               : null,
// //         );
// //       },
// //     );
// //   }
// // }

// // class TreeSearchDelegate extends SearchDelegate<TreeNode> {
// //   final List<TreeNode> treeData;

// //   TreeSearchDelegate({required this.treeData});

// //   @override
// //   List<Widget> buildActions(BuildContext context) {
// //     return [
// //       IconButton(
// //         icon: Icon(Icons.clear),
// //         onPressed: () {
// //           query = 'Nodo 1';
// //         },
// //       ),
// //     ];
// //   }

// //   @override
// //   Widget buildLeading(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(Icons.arrow_back),
// //       onPressed: () {
// //         // close(context, TreeNode(name: 'node'));
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildResults(BuildContext context) {
// //     final results = treeData
// //         .where((node) => node.name.toLowerCase().contains(query.toLowerCase()))
// //         .toList();

// //     return TreeView(data: results);
// //   }

// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     final suggestions = treeData
// //         .where((node) => node.name.toLowerCase().contains(query.toLowerCase()))
// //         .toList();

// //     return TreeView(data: suggestions);
// //   }
// // }



// import 'package:flutter/material.dart';


// class BinarySearchTree {
//   Node? root;

//   void insert(String value) {
//     final node = Node(value);

//     if (root == null) {
//       root = node;
//     } else {
//       _insertNode(root!, node);
//     }
//   }

//   void _insertNode(Node parentNode, Node newNode) {
//     if (parentNode.value.compareTo(newNode.value) > 0) {
//       if (parentNode.leftChild == null) {
//         parentNode.leftChild = newNode;
//       } else {
//         _insertNode(parentNode.leftChild!, newNode);
//       }
//     } else {
//       if (parentNode.rightChild == null) {
//         parentNode.rightChild = newNode;
//       } else {
//         _insertNode(parentNode.rightChild!, newNode);
//       }
//     }
//   }

//   Node search(String value) {
//     return _searchNode(root!, value);
//   }

//   Node _searchNode(Node node, String value) {
//     if (node == null || node.value == value) {
//       return node;
//     }

//     if (node.value.compareTo(value) > 0) {
//       return _searchNode(node.leftChild!, value);
//     } else {
//       return _searchNode(node.rightChild!, value);
//     }
//   }
// }


// class Node {
//   final String value;
//   Node? leftChild;
//   Node? rightChild;

//   Node(this.value);
// }


// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   BinarySearchTree? tree;
//   String? searchValue;
//   String? searchResult;
//   String? leftChild;
//   String? rightChild;

//   @override
//   void initState() {
//     super.initState();
//     tree = BinarySearchTree();
//     tree!.insert("Apple");
//     tree!.insert("Banana");
//     tree!.insert("Cherry");
//     tree!.insert("Grapes");
//   }

//   void search() {
//     final node = tree!.search(searchValue!);
//     if (node != null) {
//       setState(() {
//         searchResult = node.value;
//         // leftChild = node.leftChild!.value;
//         // rightChild = node.rightChild!.value;
//       });
//     } else {
//       setState(() {
//         searchResult = "No se encontró el elemento.";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Buscador con árbol de datos"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   searchValue = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: "Buscar",
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: search,
//               child: Text("Buscar"),
//             ),
//             SizedBox(height: 20),
//             Text(searchResult ?? ""),
//             // Text(leftChild ?? ""),
//             // Text(rightChild ?? ""),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SearchPage(),
//   ));
// }
