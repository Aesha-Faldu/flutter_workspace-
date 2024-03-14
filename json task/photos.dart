import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';


class photo extends StatefulWidget {


  @override
  State<photo> createState() => JsonExState();
}

class JsonExState extends State<photo>
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
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    return jsonDecode(response.body);

  }
}
