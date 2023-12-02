
// Create an application to input 2 numbers from user and all numbers
// between those 2 numbers in next activity


import 'package:firstproject/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class numberShow extends StatefulWidget {
  @override
  numberShowState createState() => numberShowState();
}

class numberShowState extends State<numberShow> {
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers Between Range' ,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            TextField(
              controller: startController,

              decoration: InputDecoration(hintText: 'Enter start number'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: endController,

              decoration: InputDecoration(hintText: 'Enter end number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                generateNumbersBetweenRange();
              },
              child: Text('Generate Numbers'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: resultController,

              decoration: InputDecoration(hintText: 'Show Numbers Between Range'),
            ),
           SizedBox(height: 20,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => loginform(),),
                  );
                },
                child: Text("Next",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
            ),


          ],
        ),
      ),
    );
  }

  void generateNumbersBetweenRange() {
    String startInput = startController.text;
    String endInput = endController.text;

    if (startInput.isNotEmpty && endInput.isNotEmpty) {
      int startNumber = int.parse(startInput);
      int endNumber = int.parse(endInput);

      if (startNumber <= endNumber) {
        List<int> numbersList = [];
        for (int i = startNumber+1; i < endNumber; i++) {
          numbersList.add(i);
        }

        resultController.text = numbersList.join(',') ;
      } else {
        resultController.text = 'End number must be greater than start number';
      }
    } else {
      resultController.text = 'Please enter both start and end numbers';
    }
  }
}





