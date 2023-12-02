import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rowCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RowCol",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("one"),
            SizedBox(width: 20,),
            Text("Two"),
            SizedBox(width: 20,),
            Text("Three"),
            SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
              child: Text("Back"),
            ),
       ]
        ),
      ),
    );
  }
}
