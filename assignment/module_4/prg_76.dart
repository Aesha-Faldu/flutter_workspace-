// Create an Application to take input two numbers from users and
// when user press button then display sum of those values of next
// Activity

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sumOfNumber extends StatefulWidget{
  @override
  sumOfNumberState  createState() => sumOfNumberState();

}

class sumOfNumberState  extends State<sumOfNumber>{

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation Of Two Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter First Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter Second Number',
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(color: Colors.brown),
                  ),

              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Validate input and navigate to the next screen
                if (firstController.text.isNotEmpty &&
                    secondController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        num1: double.parse(firstController.text),
                        num2: double.parse(secondController.text),
                      ),
                    ),
                  );
                }
              },
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final double num1;
  final double num2;

  ResultScreen({required this.num1, required this.num2});

  @override
  Widget build(BuildContext context) {
    double sum = num1 + num2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Result'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}