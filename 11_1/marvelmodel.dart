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

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(list[i]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                Text(list[i]["realname"]),
                Text(list[i]["team"]),
                Text(list[i]["firstappearance"]),
                Text(list[i]["createdby"]),
                Text(list[i]["publisher"]),
                Text(list[i]["bio"]),
                Image.network(list[i]["imageurl"]),
              ],
            ),

          );
        });
  }

}