import 'package:flutter/material.dart';
import 'list.dart';

void main() {
  runApp(SimpleListApp());
}

class SimpleListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemListScreen(),
    );
  }
}
