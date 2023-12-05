
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order.dart';


class loginform extends StatefulWidget {
  @override
  loginformState createState() => loginformState();
}

class loginformState extends State<loginform> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController UserName = TextEditingController();
    TextEditingController Password =TextEditingController();

    bool one=true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form ",style: TextStyle(color: Colors.white), ),
        backgroundColor: Colors.brown,),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: UserName,
                decoration: InputDecoration(
                  hintText: "Enter  your Name",
                  prefixIcon:Icon(Icons.person),

                ),
                onFieldSubmitted:(value) {
                  UserName.text=value.toString();
                },
                onSaved: (value){
                  UserName.text=value.toString();
                },
                validator: (value){
                  if(value.toString().isEmpty){
                    return "Enter your Name";
                  }
                  return null;
                },
              ),

              SizedBox
                (
                width: 10,
                height: 10,
              ),


              TextFormField(
                controller: Password,
                decoration: InputDecoration(
                  hintText: "Enter  your Password",
                  prefixIcon:Icon(Icons.lock),
                ),
                onFieldSubmitted: (value){
                  Password.text=value.toString();
                },
                onSaved: (value){
                  Password.text=value .toString();
                },
                validator: (value){
                  if(value.toString().isEmpty){
                    return "Enter Password";
                  }
                  return null;
                },
              ),

              SizedBox
                (
                width: 10,
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    submit();
                    if(Password.text=="1111" && UserName.text=="admin"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => orderPage(),),
                      );
                    }
                    else{
                      print("Enter Correct Password");
                    }
                  },
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
              SizedBox(height: 30,),



            ],
          ),
        ),
      ),
    );
  }



  void submit(){
    if(_formKey.currentState!.validate()){
      print("Data Process");
    }
  }
}
