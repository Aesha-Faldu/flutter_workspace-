import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json/vmodel.dart';

import 'gmodel.dart';


class secondApi extends StatefulWidget {


  @override
  State<secondApi> createState() => JsonExState();
}

class JsonExState extends State<secondApi>
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

            return gmodel(list:ss.data!!);

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
    var response = await http.get(Uri.parse("https://timocratical-curren.000webhostapp.com/view.php"));
    return jsonDecode(response.body);

  }
}

