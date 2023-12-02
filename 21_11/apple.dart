import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main()
{
  runApp(MaterialApp
    (
    home:MyHomePage(title: 'Apple',),
    debugShowCheckedModeBanner: false
    ,));
}

class Apple extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(

        title: Text("Apple Description",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:Padding(
        padding: EdgeInsets.all(30.0),
     child: Column(

        children: [
          SizedBox(height: 50,),
          Image.network(
            "https://freshindiaorganics.com/cdn/shop/products/Apples.jpg?v=1686739530",
            width: 200,
            height: 200,
          ),
          SizedBox(height: 50,),
          
          Text("An apple is a round fruit with red or green skin and a whitish inside. One variety of apple might be sweet, another sour. The apple isn't just a fruit.",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 30,),

           ElevatedButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child: Text("Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),

        ],
      ),
    ),
    );
  }

}

