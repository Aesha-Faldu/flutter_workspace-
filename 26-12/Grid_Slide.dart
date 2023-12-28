import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modelclass/slider_model.dart';

class Slid extends StatefulWidget{
  @override
  SlidState createState() => SlidState();

}

class SlidState extends State<Slid>{



  final List<Model> items =
  [
    Model(image: 'images/imgg1.jpg',title: 'ThunderStrome',subtitle: 'Description1'),
    Model(image: 'images/imgg2.jpg',title: 'Sunny',subtitle: 'Description2'),
    Model(image: 'images/imgg3.png',title: 'CloudySky',subtitle: 'Description3'),
    Model(image: 'images/imgg4.jpg',title: 'Rainy',subtitle: 'Description4'),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Slider and Grid App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.00),
        child: ListView(

          children: [



            CarouselSlider(
              items: [

                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("images/imgg2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("images/imgg3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("images/imgg4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("images/imgg1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],

              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.easeInBack,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),),


            GridView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridItem(model: items[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}



class GridItem extends StatelessWidget {
  final Model model;

  GridItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            height: 300.0,
            width: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            model.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(model.subtitle),
        ],
      ),
    );
  }
}

