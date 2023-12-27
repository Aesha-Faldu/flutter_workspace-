// create an application to increate font size when plus button click and decrease when minus button click
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class font extends StatefulWidget{
  @override
  fontState createState() =>fontState();

}

class fontState extends State<font>{

  double _fontSize = 20.0; // Initial font size

  void increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void decreaseFontSize() {
    if (_fontSize > 2.0) {
      setState(() {
        _fontSize -= 2.0;
      });
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Font Style"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello World',
              style: TextStyle(fontSize: _fontSize),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: increaseFontSize,
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: decreaseFontSize,
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}