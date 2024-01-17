// Write a code to display Splash Screen using Activity


import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class splash extends StatefulWidget
{
  @override
  splashState createState() =>splashState();

}

class splashState extends State<splash>
{
  @override void initState() {
    // TODO: implement initState
    // super.initState();

    Timer(
        Duration(seconds: 5),() =>
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("images/anim.json", height: 200, width: 200),
      ),

    );
  }

}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your main app content goes here
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text('Welcome to My app!'),
      ),
    );
  }
}
