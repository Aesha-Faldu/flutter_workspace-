
import 'package:callmsg/page_2.dart';
import 'package:flutter/material.dart';



class ListDemo1Page extends StatefulWidget {
  const ListDemo1Page({super.key});

  @override
  State<ListDemo1Page> createState() => _ListDemo1PageState();
}

class _ListDemo1PageState extends State<ListDemo1Page> {

  bool isChecked = false;
  List<String> studentList = ["Prashant","Aisha","Mansi","Suzan","Meet","Raj","Keval"];
  List<String> studentNumber = ["002987654001","002987654002","002987654003","002987654004","002987654001","002987654002","002987654003"];
  late List<bool> _isCheckedList;

  @override
  void initState() {
    super.initState();
    _isCheckedList = List<bool>.filled(studentList.length,  false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        title: Text("Student List",style: TextStyle(color: Colors.white),),
      ),
      body:ListView.separated(
        separatorBuilder: (context,index)=> const Divider(),
        itemCount: studentList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset("images/student.png",width: 50,height: 50,),
              title: Text(studentList[index],style: TextStyle(color: Colors.grey.shade700),),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(studentNumber[index],style: TextStyle(color: Colors.grey.shade700),),

                    Checkbox(
                      value: _isCheckedList[index],
                      activeColor: Colors.cyan.shade900,
                      onChanged: (value){
                        _isCheckedList[index] = value!;
                        print("isCheckedList == ${_isCheckedList[index]}");
                        setState(() {});
                      }),
                ],
              ),
            ),
          );
        },

      ),




      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListViewDemo2()),
          );
        },
        child: Text("Next"),
      ),

    );
  }
}



