// Write a program to add name from the text view and insert into the
// listview. If you click on the listview then name should be show in the
// dialog box. When user press for 2 seconds on particular List item then
// open Context Menu (Delete Item, Edit Item, Exit). If user click on
// Delete Item then Open one Alert Dialog with message (“Are you sure
// want to delete Item?”) and yes, no button if user press yes button then
// remove item from list. (Click a DELETE button, it gives a confirm box)
// If user click on Edit item then selected item display on EditText and
// again user click on button then this (updated item) should be replace
// with old item

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = [];
  TextEditingController editingController = TextEditingController();
  String selectedName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    addNameToList();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showNameInDialog(names[index]);
                  },
                  onLongPress: () {
                    showContextMenu(index);
                  },
                  child: ListTile(
                    title: Text(names[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addNameToList() {
    String newName = editingController.text;
    if (newName.isNotEmpty) {
      setState(() {
        names.add(newName);
        editingController.clear();
      });
    }
  }

  void showNameInDialog(String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Name'),
          content: Text(name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showContextMenu(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Context Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Delete Item'),
                onTap: () {
                  showDeleteConfirmation(index);
                },
              ),
              ListTile(
                title: Text('Edit Item'),
                onTap: () {
                  editItem(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                deleteItem(index);
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  void editItem(int index) {
    editingController.text = names[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: editingController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                updateItem(index);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void updateItem(int index) {
    String updatedName = editingController.text;
    if (updatedName.isNotEmpty) {
      setState(() {
        names[index] = updatedName;
        editingController.clear();
      });
    }
  }
}