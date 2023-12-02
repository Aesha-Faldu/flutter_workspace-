import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main()
{
  runApp(MaterialApp
    (
    home:MyHomePage(title: 'pineapple',),
    debugShowCheckedModeBanner: false
    ,));
}

class PineApple extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("PineApple Description",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:Padding(
    padding: EdgeInsets.all(30.0),
     child: Column(

        children: [
          SizedBox(height: 50,),
          Image.network(
            "https://cdn.pixabay.com/photo/2015/02/14/18/10/pineapple-636562_1280.jpg",
            width: 200,
            height: 200,
          ),
          SizedBox(height: 50,),

          Text("Ananas comosus (L.) Merr (Bromeliaceae), known as pineapple, is a herbaceous, biennial, tropical plant that grows up to 1.0–1.5m high and produces a fleshy, edible fruit whose flesh ranges from nearly white to yellow.",
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

