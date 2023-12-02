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

class Strawberry extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("strawberry Description",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,

      ),
      body:Padding(
        padding: EdgeInsets.all(30.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Image.network(
            "https://www.bigbasket.com/media/uploads/p/xxl/10000263-3_1-fresho-strawberry.jpg",
            width: 200,
            height: 200,
          ),
          SizedBox(height: 50,),

          Text("A strawberry is both a low-growing, flowering plant and also the name of the fruit that it produces. Strawberries are soft, sweet, bright red berries. They're also delicious. Strawberries have tiny edible seeds, which grow all over their surface.",
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