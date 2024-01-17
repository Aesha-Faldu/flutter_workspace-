// Write a code to display simple alert dialog with title, description and
// icon when button is clicked

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class imgAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Simple Alert Dialog Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child:Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context);
                },
                child: Text('Warrning'),
              ),
            ],
          ),
        ),


      ),

    );
  }




  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(
                Icons.warning,
                color: Colors.orange,
              ),
              SizedBox(height: 10,),
              Text("Close The Application"),
            ],
          ),
          content: Text('This is an important message.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),


            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();// Close the dialog
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }
}