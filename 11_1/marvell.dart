import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json/items.dart';

import 'marvelmodel.dart';


class MarvelEx extends StatefulWidget {


  @override
  State<MarvelEx> createState() => JsonExState();
}

class JsonExState extends State<MarvelEx>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Json Parsing Example"),),
      body: FutureBuilder<List>
        (
        future: getdata(),
        builder: (context,ss)
        {

          if(ss.hasData)
          {

            return Marvel(list:ss.data!!);

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

  Future<List> getdata()async
  {
    var response = await http.get(Uri.parse("https://simplifiedcoding.net/demos/marvel/"));
    return jsonDecode(response.body);

  }
}

