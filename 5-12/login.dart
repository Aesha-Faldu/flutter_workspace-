import 'package:coffeclub/register_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin_login.dart';


enum LoggedIn {Admin , User}

class loginform extends StatefulWidget{
  @override
  loginformState createState () => loginformState();


}

class loginformState extends State<loginform> {


  LoggedIn _selectedOption = LoggedIn.Admin;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("login page"),
     backgroundColor: Colors.brown,

     ),
     body: Center(
       child: Column(
         children: [
           ListTile(
             title: Text("Admin"),
             leading: Radio(
             value: LoggedIn.Admin,
             groupValue: _selectedOption,
             onChanged: (LoggedIn? value)
              {
                setState(() {
                  _selectedOption = value!;
               });
             },


             ),
           ),



           ListTile(
             title: Text("User"),
             leading: Radio(
               value: LoggedIn.User,
               groupValue: _selectedOption,
               onChanged: (LoggedIn? value)
               {
                 setState(() {
                   _selectedOption = value!;
                 }
                 );
               },
             ),
           ),

       ElevatedButton(
         onPressed: () {
           // Navigate to the selected page based on the radio button value
           if (_selectedOption == LoggedIn.Admin) {

             Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()),);


           } else if (_selectedOption == LoggedIn.User) {

             Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()),
             );
           }
         },
         child: Text("Login"),
       ),

         ],
       )
     ),
   );
  }
}