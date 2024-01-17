// Write a code to display alert dialog with list of cities and Single choice selection display selected city in TextView
import 'package:flutter/material.dart';

enum cityList{Pune,Bangloar,Mumbai,Ahmedabad,Baroda,Surat,Rajkot}

class SelectionCityPage extends StatefulWidget{
  @override
  SelectionCityPageState createState() => SelectionCityPageState();
}

class SelectionCityPageState extends State<SelectionCityPage> {
  cityList selectedCity = cityList.Pune;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.brown,
        title: Text("Selection display selected city",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown
                  ),
                  onPressed: ()async{
                    showCitySelectionDialog();
                  },
                  child: Text("select city",style: TextStyle(color: Colors.white),)),
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            height: 55,
            child: Card(
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("Selected City is ${selectedCity.toString().substring(9)}",style: TextStyle(fontSize: 16,color: Colors.white),))),
          ),
        ],
      ),
    );
  }

  void showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select a City"),
          content: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: cityList.values.map((cityList city) {
                return ListTile(
                  title: Text(city.toString().substring(9)),
                  leading: Radio(
                    value: city,
                    groupValue: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("selected city is ${selectedCity.toString().substring(9)}",style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.brown,
                          behavior: SnackBarBehavior.fixed,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
