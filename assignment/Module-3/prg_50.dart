


import 'package:firstproject/module_3/prg_51.dart';
import 'package:flutter/material.dart';

import '../login.dart';



class reverseprint extends StatefulWidget {
  @override
  reverseprintState createState() => reverseprintState();

 }

class reverseprintState extends State<reverseprint> {
  TextEditingController numberController = TextEditingController();
  TextEditingController reverseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            TextField(
              controller: numberController,
              decoration: InputDecoration(hintText: 'Enter a number'),
            ),


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                reverseNumber();
              },
              child: Text('Reverse Number'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: reverseController,
              decoration: InputDecoration(hintText: 'Reversed Number'),
            ),

            SizedBox(height: 20),


            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => numberShow(),),
                  );
                },
                child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ),

          ],
        ),
      ),
    );
  }

  void reverseNumber() {
    String input = numberController.text;
    if (input.isNotEmpty) {
      int number = int.parse(input);
      int reversedNumber = int.parse(
        input.split('').reversed.join(''),
      );
      reverseController.text = reversedNumber.toString();
    } else {
      reverseController.text = ''; // Clear the output if no input is provided
    }
  }
}
