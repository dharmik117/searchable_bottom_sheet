import 'package:flutter/material.dart';
import 'package:searchable_bottom_sheet/searchable_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Searchable Bottom sheet Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SearchableBottomSheet.show<FruitListModel>(
              context: context,
              items: fruitList,
              onItemSelected: (selectedFruit) {
                debugPrint("Selected Fruit: ${selectedFruit.fruitName}");
              },
              searchKey: (fruit) => [fruit.fruitName],
              useSafeArea: true,
              itemBuilder: (fruit) => ListTile(
                title: Text(fruit.fruitName),
              ),
            );
          },
          child: Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}

class FruitListModel {
  final String fruitName;

  FruitListModel({required this.fruitName});
}

final fruitList = [
  FruitListModel(fruitName: "Mango"),
  FruitListModel(fruitName: "Apple"),
  FruitListModel(fruitName: "Banana"),
];
