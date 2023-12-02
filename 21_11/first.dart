import 'package:firstproject/pineapple.dart';
import 'package:firstproject/strawberry.dart';
import 'package:firstproject/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apple.dart';
import 'grapes.dart';
import 'mango.dart';



class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page",style: TextStyle(color: Colors.white),),
        backgroundColor:Colors.green ,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),


              Text("1.Apple",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ,),

            InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Apple(),),);
            },
              child: Image.network(
                "https://freshindiaorganics.com/cdn/shop/products/Apples.jpg?v=1686739530",
                width: 200,
                height: 200,
              ),),

              SizedBox(width: 100, height: 30),



              Text("2.Mango",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Mango(),),);
            },
              child: Image.network(
               "https://ichef.bbci.co.uk/images/ic/1920x1080/p06hk0h6.jpg",
                width: 200,
                height: 200,
              ),),

              SizedBox(width: 100, height: 30),



              Text("3.strawberry",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Strawberry(),),);
            },
              child:Image.network(
               "https://www.bigbasket.com/media/uploads/p/xxl/10000263-3_1-fresho-strawberry.jpg",
                width: 200,
                height: 200,
              ),),

              SizedBox(width: 100, height: 50),



              Text("4.pineapple",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PineApple(),),);
              },
              child:Image.network(
                "https://cdn.pixabay.com/photo/2015/02/14/18/10/pineapple-636562_1280.jpg",
                width: 200,
                height: 200,
              ),),

              SizedBox(width: 100, height: 30),



              Text("5.grapes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Grapes(),),);
            },
            child:Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJfsd3g7ylM-5xq90vHjlrsFZRvrDMGlO3JA&usqp=CAU",
                width: 200,
                height: 200,
              ),),

              SizedBox(width: 100, height: 30),



              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage(),),
                  );
                },
                  child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}


