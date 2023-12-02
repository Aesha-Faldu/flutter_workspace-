import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

import 'first.dart';

void main()
{
  runApp(MaterialApp
    (
    home:MyHomePage(title: 'Mango',),
    debugShowCheckedModeBanner: false
    ,));
}

class Mango extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Mango Description",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body:Padding(
    padding: EdgeInsets.all(30.0),
      child:Column(

        children: [
          SizedBox(height: 50,),
       Image.network(
      "https://ichef.bbci.co.uk/images/ic/1920x1080/p06hk0h6.jpg",
        width: 200,
        height: 200,
      ),
          SizedBox(height: 50,),

          Text("A mango is a sweet tropical fruit, and it's also the name of the trees on which the fruit grows. Ripe mangoes are juicy, fleshy, and delicious. Like peaches and plums, mangoes have an inedible pit at the center. Unlike these other fruits, the skin of a mango is very tough and also inedible.",
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

