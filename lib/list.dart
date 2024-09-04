import 'package:flutter/material.dart';
import 'form.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Map<String, String>> _items = [];

  void _addItem(String title, String description) {
    setState(() {
      _items.add({'title': title, 'description': description});
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _openAddItemForm() async {
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => AddItemForm()),
    );
    if (newItem != null) {
      _addItem(newItem['title'], newItem['description']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                // Handle menu button press here
              },
            ),
            SizedBox(width: 8.0),
            Text(
              'Test App',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
            child: TextButton.icon(
              onPressed: _openAddItemForm,
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'New',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _items.isEmpty
          ? Center(child: Text('No items added yet!'))
          : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (ctx, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                _items[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_items[index]['description']!),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => _deleteItem(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
