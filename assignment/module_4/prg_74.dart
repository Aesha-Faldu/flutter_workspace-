// Write a code to redirect user from one activity to another when
// button click.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pushPoP extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('push Second Page'),),
      body:Center(
        child: ElevatedButton(
        onPressed: () {
      // Navigate to the second screen when the button is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen()),
      );
    },
    child: Text('Open Another Screen'),
    ),
    ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the second screen!'),
      ),
    );
  }
}