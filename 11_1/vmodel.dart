import 'package:flutter/material.dart';

class vmodel extends StatelessWidget
{
  late List list;
  vmodel({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount:list.length,
        itemBuilder:(context,i)
        {
          return ListTile

            (
            leading: Image.network(list[i]["v_image"],height: 50,width: 50,),
            title: Text(list[i]["v_name"].toString()),
            subtitle:Text(list[i]["v_name"].toString()),

            );

        });
  }

}