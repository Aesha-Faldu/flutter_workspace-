import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LoginPage extends StatefulWidget
{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  late SharedPreferences logindata;
  late bool newuser;
  TextEditingController monum = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();

    checkifalreadylogin();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title:Text("Login Form"),),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center
          (
          child: Container
            (
            child: Column
              (
              children:
              [

                TextFormField(
                  controller: monum,
                  decoration: InputDecoration(
                    labelText: "Enter your MobileNumber",
                    prefixIcon: Icon(Icons.phone_callback_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),

                  keyboardType: TextInputType.number,  // Specify the number keyboard
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,  // Allow only numeric input
                    LengthLimitingTextInputFormatter(10),  // Limit to 10 characters
                  ],
                  onFieldSubmitted: (value) {
                    monum.text = value.toString();
                  },
                  onSaved: (value) {
                    monum.text = value.toString();
                  },
                  validator: (value) {
                    if (value
                        .toString()
                        .isEmpty) {
                      return "Enter MobileNumber";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),

                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    labelText: "Enter  your Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onFieldSubmitted: (value) {
                    password.text = value.toString();
                  },
                  onSaved: (value) {
                    password.text = value.toString();
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Enter your Password";
                    }

                    if (!isValidPassword(value.toString())) {
                      return "Password must have at least 6 characters, including uppercase, lowercase, digit, and special character.";
                    }

                    return null;
                  },
                ),
                ElevatedButton(onPressed: ()async
                {

                  var url = Uri.parse("https://topsapi.000webhostapp.com/Flutter_Task/login.php");

                  var response = await http.post(url,
                      body:
                      {
                        "phone":monum.text.toString(),
                        "password":password.text.toString(),
                      });
                  var data = json.decode(response.body);
                  if(data==0)
                  {
                    print("Loggin Fail");
                  }
                  else
                  {
                    logindata.setBool('login', false);
                    logindata.setString('phone', monum.text.toString());
                      print("Loggin Success");
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()));
                  }
                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                }, child: Text("Login"))

              ],
            ),
          ),
        ),
      ),

    );
  }

  void checkifalreadylogin() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Home()));
    }
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex =
    RegExp(r'^[a-z0-9._-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$');
    return emailRegex.hasMatch(email);
  }
  bool isValidPassword(String password) {
    final RegExp passwordRegex =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{6,}$');
    return passwordRegex.hasMatch(password);
  }

}