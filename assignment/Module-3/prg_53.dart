// 53. create an application to change background when button is clicked

import 'dart:math';

import 'package:flutter/material.dart';

class Task extends StatefulWidget {

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  Color _backgroundColor = Colors.pink;

  void _changeBackgroundColor() {
    // Generate a random color
    final random = Random();
    Color newColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );

    setState(() {
      _backgroundColor = newColor;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Background Changer'),
        ),
        body: Container(
          color: _backgroundColor,
          child: Center(
            child: ElevatedButton(
              onPressed: _changeBackgroundColor,
              child: Text('Change Background'),
            ),
          ),
        )
    );
  }
}
