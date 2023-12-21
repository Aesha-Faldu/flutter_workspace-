
import 'package:flutter/material.dart';

import 'modelclass/temprature_model.dart';


class ListViewDemo3 extends StatefulWidget {
  const ListViewDemo3({super.key});

  @override
  State<ListViewDemo3> createState() => _ListViewDemo3State();
}

class _ListViewDemo3State extends State<ListViewDemo3> {

  List<TemperatureModel> temperatureData = [
    TemperatureModel("images/tem6.webp", "Berlin", "Snowing", "0"),
    TemperatureModel("images/tem8.webp", "Bangalore", "Stormy", "20"),
    TemperatureModel("images/tem7.webp", "Rajkot", "Rain", "45"),
    TemperatureModel("images/tem1.webp", "Ahmedabad", "Cloudy", "15"),
    TemperatureModel("images/tem5.webp", "GandhiNagar", "Windy", "33"),
    TemperatureModel("images/tem2.webp", "Surat", "Hot", "52"),
  ];



  late List<bool> selected ;
  @override
  void initState() {
    selected = List<bool>.filled(temperatureData.length, false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 25,
                alignment: Alignment.centerLeft,
                color: Colors.grey,
                child: Text("  Weather Information",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: temperatureData.length,
                  itemBuilder: (context,index){
                    var mIndex = temperatureData[index];
                    return Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: selected[index]?Color(0xFF39d1e5):Color(0xFFe2e2e2),
                          border: Border(
                            top:BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                          )
                      ),
                      child:ListTile(
                        leading: Image.asset(mIndex.image,fit: BoxFit.cover,),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(mIndex.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text(mIndex.degrees,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                                Text("\u2103",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                                SizedBox(width: 20,),
                                Container(
                                  height: 35,
                                  alignment: Alignment.bottomCenter,
                                  child: Icon(Icons.navigate_next,size: 18,),
                                ),
                              ],
                            ),

                          ],
                        ),
                        subtitle:  Text(mIndex.subtitle),
                        onTap: (){
                          setState(() {
                            selected[index] = !selected[index];
                            print(" selected => ${ selected[index]}");
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
}


