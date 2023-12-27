// 58. Write a program you have taken three seek bar controls. From three
// Seekbar which Seekbar value changed the background color of device
// will be changed.

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double slideValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slideValue == 20?Colors.pink:slideValue == 40?Colors.purple.shade700:
      slideValue == 60?Colors.purpleAccent:slideValue == 80?Colors.pinkAccent:slideValue == 100?Colors.orange:Colors.pinkAccent.shade700,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text("Select to Change Color on Slider",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w800),),
          SizedBox(height: 15,),
          Slider(
              value: slideValue,
              max: 100,
              label: slideValue == 20?"pink":slideValue == 40?"purple": slideValue == 60?"purpleAccent":slideValue == 80?"pinkAccent":slideValue == 100?"Orange":"pink",
              thumbColor: Colors.white,
              activeColor: Colors.black26,
              inactiveColor: Colors.white38,
              divisions: 5,
              onChanged: (value){
                setState(() {
                  slideValue = value;
                  print("slideValue ===> $slideValue.");
                });
              }),
        ],
      ),
    );
  }
}
