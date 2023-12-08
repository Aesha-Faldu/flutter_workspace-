import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class orderPage extends StatefulWidget {
  @override
  orderPageState createState() => orderPageState();
}

class orderPageState extends State<orderPage> {

  DateTime? _currentBackPressTime;


  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  var total = 0;
  var amount = 0;
  var data = "";

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
          _currentBackPressTime = now;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press back button again to exit'),
            ),
          );

          return false;
        }else
        {
          exit(0);

        }
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Coffee Club",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "images/coffe.jpg",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text("Coffe"),
                        subtitle: Text("Rs.100"),
                        value: this.one,
                        onChanged: (bool? value) {
                          setState(() {
                            this.one = value!;
                            amount += 100;
                            data += "\n Coffe @ Rs.100";
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "images/tea.jpg",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text("Tea"),
                        subtitle: Text("Rs.90"),
                        value: this.two,
                        onChanged: (bool? value) {
                          setState(() {
                            this.two = value!;
                            amount += 90;
                            data += "\n Tea @ Rs.90";
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "images/sandwich.webp",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text("Sandwich"),
                        subtitle: Text("Rs.150"),
                        value: this.three,
                        onChanged: (bool? value) {
                          setState(() {
                            this.three = value!;
                            amount += 150;
                            data += "\n Sandwich @ Rs.150";
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "images/garlicbread.jpg",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title: Text("Garlic Bread"),
                        subtitle: Text("Rs.200"),
                        value: this.four,
                        onChanged: (bool? value) {
                          setState(() {
                            this.four = value!;
                            amount += 200;
                            data += "\n Garlic Bread @ Rs.200";
                          });
                        }),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print(" Bill ");
                    print(" $data");
                    print("Total: $amount");
                  },
                  child: Text("Order")),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(onPressed: (){
                showalert(context);
              },
                  child: Text("Exit"))
            ],
          ),
        ),
      ),
    );
  }




  showalert(BuildContext context)async
  {

    Widget YESButton = ElevatedButton
      (
      child: Text("YES"),
      onPressed: ()
      {
        SystemNavigator.pop();
      },
    );

    Widget NOButton = ElevatedButton
      (
      child: Text("NO"),
      onPressed: ()
      {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog
      (
      title: Text("Coffe_Club App"),
      content: Text("Are you sure you want to exit?"),
      actions:
      [
        YESButton,
        NOButton

      ],
    );

    showDialog
      (
      context: context,
      builder: (BuildContext context)
      {
        return alert;
      },
    );

  }



  //
  //  ShowDialog()async{
  //   await showDialog(context: context, builder: (BuildContext context){
  //     return AlertDialog(
  //       backgroundColor: Colors.blue.withOpacity(0.3),
  //       title: Text("Music App",style: TextStyle(color: Colors.white),),
  //       content: Text("Are Sure want to Exit App?",style: TextStyle(color: Colors.white)),
  //       // actionsAlignment: MainAxisAlignment.spaceAround,
  //       actions: [
  //         ElevatedButton(onPressed: (){
  //           exit(0);
  //         },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.5)), child: Text("Yes")),
  //         ElevatedButton(onPressed: (){
  //           Navigator.of(context).pop();
  //         },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.5)), child: Text("No"))
  //       ],
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //     );
  //   });
  // }
}


