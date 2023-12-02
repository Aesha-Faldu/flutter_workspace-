import 'package:firstproject/row_col.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main()
{
  runApp(MaterialApp
    (
    home:MyHomePage(),
    debugShowCheckedModeBanner: false
    ,));
}

class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Welcome Page",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(
              onPressed: ()
              {
                Navigator.push(context,MaterialPageRoute(builder:(BuildContext context) =>  rowCol(),),
                );

                print("Welcome");
              },
              child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
    ),
        ],
      ),
    );
  }

}

