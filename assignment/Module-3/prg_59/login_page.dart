import 'package:firstproject/module_3/prg_59/welcome_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController UserName = TextEditingController();
    TextEditingController Password = TextEditingController();

    bool one = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Form ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: UserName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  labelText: "Enter  your Name",
                  prefixIcon: Icon(Icons.person),
                ),
                onFieldSubmitted: (value) {
                  UserName.text = value.toString();
                },
                onSaved: (value) {
                  UserName.text = value.toString();
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter your Name";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                controller: Password,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Password.text = value.toString();
                },
                onSaved: (value) {
                  Password.text = value.toString();
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    submit();
                    if (Password.text == "1111" && UserName.text == "admin") {
                      Fluttertoast.showToast(
                          msg: "Loggin Suceesfully",
                          toastLength: Toast.LENGTH_SHORT,

                          // webBgColor: "linear-gradient(to right, #33ccff, #ff99cc)",
                          backgroundColor: Colors.brown,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 15);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => WelCome(),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Loggin Fail,Try Agin",
                          toastLength: Toast.LENGTH_SHORT,
                          // webBgColor: "linear-gradient(to right, #33ccff, #ff99cc)",
                          backgroundColor: Colors.brown,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 15);
                      print("Enter Correct Password");
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      print("Data Process");
    }
  }
}
