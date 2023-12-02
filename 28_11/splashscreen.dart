import 'dart:async';

import 'package:firstproject/25_11/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'module_3/prg_50.dart';

class loadingscreen extends StatefulWidget
{
  @override
  loadingscreenState createState() =>loadingscreenState();

}

class loadingscreenState extends State<loadingscreen>
{
  @override void initState() {
    // TODO: implement initState
    // super.initState();

    Timer(
        Duration(seconds: 5),() =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => reverseprint()))
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