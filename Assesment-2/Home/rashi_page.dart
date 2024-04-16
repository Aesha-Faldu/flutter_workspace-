import 'dart:convert';
import 'package:babyname/Home/rashiModel.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RashiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rashi Page'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Hindi'),
              Tab(text: 'English'),
              Tab(text: 'Gujarati'),
            ],
          ),
        ),
        body:TabBarView(
          children: [

              Column(
                children: [
                  FutureBuilder<List>(
                    future: getdata(),
                    builder: (context, ss) {
                      if (ss.hasData) {
                        // Assuming RashiModel accepts the list of data
                        return RashiModel(list: ss.data!!);
                      }
                      if (ss.hasError) {
                        print('Network Not Found');
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
            ),
            Column(
              children: [
                FutureBuilder<List>(
                  future: getdata(),
                  builder: (context, ss) {
                    if (ss.hasData) {
                      // Assuming RashiModel accepts the list of data
                      return RashiModel(list: ss.data!!);
                    }
                    if (ss.hasError) {
                      print('Network Not Found');
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                FutureBuilder<List>(
                  future: getdata(),
                  builder: (context, ss) {
                    if (ss.hasData) {
                      // Assuming RashiModel accepts the list of data
                      return RashiModel(list: ss.data!!);
                    }
                    if (ss.hasError) {
                      print('Network Not Found');
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }

  Future<List> getdata()async
  {
    var response = await http.get(Uri.parse("https://aesha2002.000webhostapp.com/BabyName/Rashi/view.php"));
    return jsonDecode(response.body);

  }
}
