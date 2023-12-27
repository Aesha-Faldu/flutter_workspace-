// 52. Create an application with radio buttons (Add, Substraction, Multiply, Division) EditText (number1, number2) and print
// result as per user choice from radio button in TextView

import 'package:flutter/material.dart';


class ArithmeticPage extends StatefulWidget {
  const ArithmeticPage({Key? key}) : super(key: key);

  @override
  State<ArithmeticPage> createState() => _ArithmeticPageState();
}

class _ArithmeticPageState extends State<ArithmeticPage> {


  TextEditingController firstValueController = TextEditingController();
  TextEditingController secondValueController = TextEditingController();
  String result = '';
  String operation = 'Addition';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstValueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first value'),
            ),
            TextField(
              controller: secondValueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second value'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Radio(
                  value: 'Addition',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Addition'),
                Radio(
                  value: 'Subtraction',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Subtraction'),
                Radio(
                  value: 'Multiplication',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Multiplication'),
                Radio(
                  value: 'Division',
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text('Division'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double firstValue = double.tryParse(firstValueController.text) ?? 0.0;
                double secondValue = double.tryParse(secondValueController.text) ?? 0.0;

                double resultValue = 0.0;

                switch (operation) {
                  case 'Addition':
                    resultValue = firstValue + secondValue;
                    break;
                  case 'Subtraction':
                    resultValue = firstValue - secondValue;
                    break;
                  case 'Multiplication':
                    resultValue = firstValue * secondValue;
                    break;
                  case 'Division':
                    if (secondValue != 0) {
                      resultValue = firstValue / secondValue;
                    } else {
                      result = 'Cannot divide by zero';
                      return;
                    }
                    break;
                }

                setState(() {
                  result = 'Result: $resultValue';
                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16.0),
            Text(result, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),

    );
  }
}

