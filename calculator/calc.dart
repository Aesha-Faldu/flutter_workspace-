import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HistoryPage.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

TextEditingController number1 = TextEditingController();
TextEditingController number2 = TextEditingController();
TextEditingController answer = TextEditingController();

String? _selectedOption = 'Add';
List<String> options = ['Add', 'Sub', 'Mul', 'Div'];

class _CalcState extends State<Calc> {
  Future<void> _calculate() async {
    double num1 = double.parse(number1.text);
    double num2 = double.parse(number2.text);
    double result;

    switch (_selectedOption) {
      case 'Add':
        result = num1 + num2;
        break;
      case 'Sub':
        result = num1 - num2;
        break;
      case 'Mul':
        result = num1 * num2;
        break;
      case 'Div':
        result = num1 / num2;
        break;
      default:
        result = 0.0;
    }

    answer.text = result.toString();
    String calculation = "$num1 $_selectedOption $num2 = $result";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? [];
    history.add(calculation);
    await prefs.setStringList('history', history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: number1,
                    decoration: InputDecoration(
                      labelText: "Enter First Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.00),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: number2,
                    decoration: InputDecoration(
                      labelText: "Enter Second Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.00),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text("Select Option to Calculate Your Number"),
                    subtitle: DropdownButton<String>(
                      value: _selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items: options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculate,
                    child: Text("Calculate"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: answer,
                    decoration: InputDecoration(
                      labelText: "Show Answer",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.00),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    readOnly: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                      );
                    },
                    child: Text("History"),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
