// Write a program in android display screen color which the Color will
// be select from the radio button

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioColor extends StatefulWidget{
  @override
  RadioColorState createState() => RadioColorState();

}

class RadioColorState extends State<RadioColor>{



  Color _selectedColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Container(
        color: _selectedColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<Color>(
                title: Text('Red'),
                value: Colors.red,
                groupValue: _selectedColor,
                onChanged: (Color? value) {
                  _changeColor(value!);
                },
              ),
              RadioListTile<Color>(
                title: Text('Green'),
                value: Colors.green,
                groupValue: _selectedColor,
                onChanged: (Color? value) {
                  _changeColor(value!);
                },
              ),
              RadioListTile<Color>(
                title: Text('Blue'),
                value: Colors.blue,
                groupValue: _selectedColor,
                onChanged: (Color? value) {
                  _changeColor(value!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}