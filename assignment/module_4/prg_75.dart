import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class androidLifeCycle extends StatefulWidget{
  @override
  androidLifeCycleState createState() => androidLifeCycleState();

}

class androidLifeCycleState extends State<androidLifeCycle>with WidgetsBindingObserver{
    @override
    void initState() {
      super.initState();
      showToast("initState");
    }

    @override
    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      showToast("didChangeDependencies");
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Activity Lifecycle Demo'),
        ),
        body: Center(
          child: Text('This is the main screen!'),
        ),
      );
    }


    @override
    void didUpdateWidget(androidLifeCycle oldWidget) {
      super.didUpdateWidget(oldWidget);
      showToast("didUpdateWidget");
    }

    @override
    void dispose() {
      showToast("dispose");
      super.dispose();
    }

    void showToast(String message) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }


  }