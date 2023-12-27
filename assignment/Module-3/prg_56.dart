// Write a program to show four images around Textview

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imageGallery extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/image1.png',
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(width: 10.0),
                Image.asset(
                  'images/image1.png',
                  width: 50.0,
                  height: 50.0,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'IMAGE GALLERY',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/image1.png',
                  width: 50.0,
                  height: 50.0,
                ),
                SizedBox(width: 10.0),
                Image.asset(
                  'images/image1.png',
                  width: 50.0,
                  height: 50.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}