import 'package:flutter/material.dart';

import 'imgalert.dart';

class loginalert extends StatefulWidget {
  @override
  loginalertState createState() => loginalertState();
}

class loginalertState extends State<loginalert> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Dialog Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child:Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _showLoginDialog(context);
                },
                child: Text('Open Login Dialog'),
              ),
            ],
          ),
        ),


      ),
    );
  }

  void _showLoginDialog(BuildContext context) async {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  labelText: "Enter  your Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),



              SizedBox(
                height: 25,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.brown),
                  ),
                  labelText: "Enter  your Name",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                String username = usernameController.text;
                String password = passwordController.text;

                // Replace the following logic with your actual login validation
                if (username == 'aesha' &&
                    password == '1111') {
                  Navigator.of(context).pop(); // Close the dialog
                  _showSuccessDialog(context, username);
                } else {
                  // Show an error message or handle authentication failure
                  // For simplicity, just print an error message here
                  print('Login failed. Please check your credentials.');
                }
              },
              child: Text('Login'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Successful'),
          content: Text('Welcome, $username!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => imgAlert(),),);// Close the success dialog
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
