import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main()
{
  runApp(MaterialApp
    (
    home:MyHomePage(title: 'Grapes',),
    debugShowCheckedModeBanner: false
    ,));
}

class Grapes extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Grapes Description",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:Padding(
    padding: EdgeInsets.all(30.0),
      child:Column(

        children: [
          SizedBox(height: 50,),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJfsd3g7ylM-5xq90vHjlrsFZRvrDMGlO3JA&usqp=CAU",
            width: 200,
            height: 200,
          ),
          SizedBox(height: 50,),

          Text("A grape is a fruit, botanically a berry, of genus Vitis and family Vitaceae. Grapes grow in clusters of 15–300 in different colors (crimson, black, dark blue, yellow, green, orange, pink, and white) and are specifically a nonclimacteric type and deciduous crop.",
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

