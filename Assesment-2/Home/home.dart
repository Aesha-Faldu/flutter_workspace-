import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'meaningmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BabyName> babyNames = [];

  @override
  void initState() {
    super.initState();
    fetchBabyNames();
  }

  Future<List> fetchBabyNames()async
  {
    var response = await http.get(Uri.parse("https://aesha2002.000webhostapp.com/BabyName/Meaning/view.php"));
    return jsonDecode(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Baby Nmaes",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Container(
        color: Colors.pink.shade200,
        child: Drawer(
          backgroundColor: Colors.pink.shade300.withOpacity(0.2),
          surfaceTintColor: Colors.white,
          child: ListView(
            // padding: EdgeInsets.all(10.00),
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.pink,),
                accountName: Text(
                  "Baby Names",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                currentAccountPicture:CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage("images/logo.png"),
                    backgroundColor: Colors.white,
                  ),

                accountEmail: null,
              ),

              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.ac_unit_sharp,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Rashi',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nothing is Archieved")),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.camera_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Religion',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nothing is Deleted")),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Favourite',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
              Center(
                child: ListTile(
                  leading: Icon(
                    Icons.people_rounded,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Devloper',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body:FutureBuilder<List>
        (
        future: fetchBabyNames(),
        builder: (context,ss)
        {

          if(ss.hasData)
          {

            return BabyName(list:ss.data!!);

          }
          if(ss.hasError)
          {
            print('Network Not Found');
          }

          return CircularProgressIndicator();


        },

      ) ,
    );
  }
}
