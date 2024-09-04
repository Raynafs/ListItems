import 'package:flutter/material.dart';

class AddItemForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Item',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '*Indicates required fields',
                style: TextStyle(color: Colors.redAccent),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Item Title*',
                  border: OutlineInputBorder(),
                  hintText: 'Enter a title for the item',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  hintText: 'Add description',
                ),
                maxLines: 4,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        final newItem = {
                          'title': titleController.text,
                          'description': descriptionController.text
                        };
                        Navigator.of(context).pop(newItem);
                      }
                    },
                    child: Text('Add Item'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
