import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../first.dart';

class loginform extends StatefulWidget {
  @override
  loginformState createState() => loginformState();
}

class loginformState extends State<loginform> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController UserName = TextEditingController();
    TextEditingController Email =TextEditingController();
    TextEditingController Password =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text("Login Form ",style: TextStyle(color: Colors.white), ),
        backgroundColor: Colors.green,),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Text("Login Form",style: TextStyle(fontSize: 24.0)),
              // SizedBox
              //   (
              //   width: 10,
              //   height: 10,
              // ),
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
                controller: Email,
                decoration: InputDecoration(
                  hintText: "Enter  your Email_id",
                  prefixIcon:Icon(Icons.email),
                ),
                onFieldSubmitted: (value){
                  Email.text=value.toString();
                },
                onSaved: (value){
                  Email.text=value.toString();
                },
                validator: (value ){
                  if(value.toString().isEmpty){
                    return "Enter your Email";


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
                    if(Password.text=="12345"){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FirstPage(),),
                      );
                    }
                    else{
                      print("Enter Correct Password");
                    }
                  },
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ),
              SizedBox(height: 30,)
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
