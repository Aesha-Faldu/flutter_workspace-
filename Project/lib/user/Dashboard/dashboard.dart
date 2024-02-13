import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/user/bottomnavigation/download/download.dart';
import 'package:project/user/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottomnavigation/home/home.dart';

class DashBoard extends StatefulWidget
{
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
{
  late SharedPreferences logindata;
  late String phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }



  void initial() async
  {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      phone = logindata.getString('monum')!;
    });
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
            Home(),
           Download(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Text('Welcome  to Success CLub', style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.brown,
      actions:
      [
        IconButton(onPressed: ()
        {

          logindata.setBool('login', true);
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => LoginPage()));
        }, icon: Icon(Icons.logout))

      ],),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.brown,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),
    );

  }
}
