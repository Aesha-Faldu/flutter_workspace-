// create an application to display Textview when checkbox is checked and hide otherwise
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkBox extends StatefulWidget{
  @override
  checkBoxState createState() =>checkBoxState();

}

class checkBoxState extends State<checkBox>{

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            if (isChecked)
              Text(
                'Checkbox is Checked',
                style: TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }
}