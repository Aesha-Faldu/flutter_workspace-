import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwitchScreen extends StatefulWidget
{
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen>
{

  DateTime? _currentBackPressTime;

  bool isSwitched = false;
  final player = AudioPlayer();
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) /*async*/
  {
    if (isSwitched == false)
    {

      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
        // player.play(AssetSource('images/abc.mp3'));
        player.play(UrlSource('https://topsapi.000webhostapp.com/abc.mp3'));
      });
      // player.play(AssetSource('images/abc.mp3'));
      print('Switch Button is ON');
    }
    else
    {
      player.stop();
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context)
  {

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

      appBar: AppBar(title: Text("Songs"),),
      body: Center(

          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(scale: 2,
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,)),
                SizedBox(height: 25,),
                Text('$textValue', style: const TextStyle(fontSize: 20),),
                SizedBox(height: 25,),


                ElevatedButton(onPressed: (){
                  showalert(context);
                },
                    child: Text("Exit"))

                // ElevatedButton(
                //   onPressed: () =>
                //   {
                //     // player.play(UrlSource('https://topsapi.000webhostapp.com/abc.mp3'))
                //   },
                //   child: Text('Play'),
                // )
              ])


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
}
