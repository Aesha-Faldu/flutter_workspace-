import 'package:flutter/material.dart';

class SecondPageDesign extends StatelessWidget {
  const SecondPageDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var decription = 'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
        'Bernese Alps. Situated 1,578 meters above sea level, it '
        'is one of the larger Alpine Lakes. A gondola ride from '
        'Kandersteg, followed by a half-hour walk through pastures '
        'and pine forest, leads you to the lake, which warms to '
        '20 degrees Celsius in the summer. Activities enjoyed here '
        'include rowing, and riding the summer toboggan run.';
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.width*0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/images/background.png",),
                    fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Oeschinen Lake Campground" ,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey[500]),),

                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.red,),
                          Text("41"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.call,color: Colors.blue,size: 25,),
                          Text("CALL",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.send,color: Colors.blue,size: 25,),
                          Text("ROUTE",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share,color: Colors.blue,size: 25,),
                          Text("SHARE",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(decription),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
