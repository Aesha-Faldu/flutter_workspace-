
import 'package:flutter/material.dart';

class RashiModel extends StatelessWidget
{
  late List list;
  RashiModel({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return Expanded(
      child: ListView.builder(
          itemCount:list.length,
          itemBuilder:(context,i)
          {
            return ListTile
              (
              leading: Image.network(list[i]["img"].toString(),
              height: 20,
                width: 20,
                fit: BoxFit.cover,

              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("id: ${list[i]['id'].toString()}"),
                  Text("title: ${list[i]['title'].toString()}"),
                  Text("subtile: ${list[i]['subtile'].toString()}"),

                ],
              ),

            );
          }),
    );
  }

}
