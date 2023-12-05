import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class orderPage extends StatefulWidget{
  @override
  orderPageState  createState() => orderPageState();

}

class orderPageState extends State<orderPage>  {


  void exitApp(){
    SystemNavigator.pop();
  }

  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  var total=0;
  var amount=0;
  var data="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Coffee Club",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),

        child: Column(
          children: [
            CheckboxListTile(
                title: Text("Coffe"),
                subtitle: Text("Rs.100"),
                value: this.one,
                onChanged: (bool? value)
                {
                  setState(() {
                    this.one=value!;
                    amount+=100;
                    data+="\n Coffe @ Rs.100";
                  }
                  );
                }
            ),



            CheckboxListTile(
                title: Text("Tea"),
                subtitle: Text("Rs.90"),
                value: this.two,
                onChanged: (bool? value)
                {
                  setState(() {
                    this.two=value!;
                    amount+=90;
                    data+="\n Tea @ Rs.90";
                  }
                  );
                }
            ),






            CheckboxListTile(
                title: Text("Sandwich"),
                subtitle: Text("Rs.150"),
                value: this.three,
                onChanged: (bool? value)
                {
                  setState(() {
                    this.three=value!;
                    amount+=150;
                    data+="\n Sandwich @ Rs.150";
                  }
                  );
                }
            ),


            CheckboxListTile(
                title: Text("Garlic Bread"),
                subtitle: Text("Rs.200"),
                value: this.four,
                onChanged: (bool? value)
                {
                  setState(() {
                    this.four=value!;
                    amount+=200;
                    data+="\n Garlic Bread @ Rs.200";
                  }
                  );
                }
            ),

            ElevatedButton(onPressed: (){
              print(" Bill ");
              print(" $data");
              print("Total: $amount");
            },
                child: Text("Order")
            ),

            SizedBox(width: 30,),

            ElevatedButton(
              onPressed: exitApp,
              child: Text("Exit"),
            ),

          ],
        ),
      ),
    );
  }
}
