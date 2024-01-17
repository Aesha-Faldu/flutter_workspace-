// Write a code to display alert dialog with positive, negative and
// neutral button and display toast respectively user's choice

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialog extends StatefulWidget{
  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Alert Dialog & Toast'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('Choose an option:'),
          actions: [
            TextButton(
              onPressed: () {
                _showToast('Positive Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Positive'),
            ),
            TextButton(
              onPressed: () {
                _showToast('Negative Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Negative'),
            ),
            TextButton(
              onPressed: () {
                _showToast('Neutral Button Pressed');
                Navigator.of(context).pop();
              },
              child: Text('Neutral'),
            ),
          ],
        );
      },
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}