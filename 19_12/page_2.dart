
import 'package:callmsg/page_3.dart';
import 'package:flutter/material.dart';
import 'modelclass/job_model.dart';

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({super.key});

  @override
  Widget build(BuildContext context) {

    List<JobListModel> jobFoundList = [
      JobListModel("Accountant", "Pune", "0-4 Lakhs", "Dec 20,2023 - Feb 12,2024"),
      JobListModel("PHP Developer", "Ahmedabad", "0-2 Lakhs", "Dec 20,2023 - Jan 05,2024"),
      JobListModel("Flutter Developer", "Ahmedabad", "3-6 Lakhs", "Dec 20,2023 - Jan 04,2024"),
      JobListModel("Accountant", "Rajkot", "0-2 Lakhs", "Dec 20,2023 - Jan 10,2024"),
      JobListModel("Accountant", "Mumbai", "5-10 Lakhs", "Dec 20,2023 - Jan 12,2024"),
      JobListModel("Flutter", "Pune", "5-10 Lakhs", "Dec 20,2023 - Feb 04,2024"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Jobs Found",style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          itemCount: jobFoundList.length,
          itemBuilder: (context,index){
            var mIndex = jobFoundList[index];
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.deepPurple,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(mIndex.title.toString(),style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Icon(Icons.location_pin,color:Colors.blue.shade700,size: 14,),
                          Text(mIndex.city.toString(),style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,color:Colors.blue.shade700,size: 14,),
                          Text(mIndex.date.toString(),style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 15,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text("\u{20B9}",style: TextStyle(color:Colors.blue.shade700,fontSize: 14,fontWeight: FontWeight.w500)),
                          Text(mIndex.salary.toString(),style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 95,
                          height: 50,
                          color: Colors.orange,
                          margin: EdgeInsets.only(right: 15,bottom: 10),
                          alignment: Alignment.center,
                          child: Text("Full Time",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500)),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            );
          },
      ),


    floatingActionButton: ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ListViewDemo3()),
    );
    },
    child: Text("Next Page"),
    ),

    );
  }
}
