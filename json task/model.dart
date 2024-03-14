import 'package:flutter/material.dart';

class Marvel extends StatelessWidget
{
  late List list;
  Marvel({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount:list.length,
        itemBuilder:(context,i)
        {
          return ListTile
            (
          leading: Image.network(list[i]["url"]),
            trailing:  Image.network(list[i]["thumbnailUrl"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("albumId: ${list[i]['albumId'].toString()}"),
                Text("id: ${list[i]['id'].toString()}"),
                Text("title: ${list[i]['title']}"),

              ],
            ),

          );
        });
  }

}