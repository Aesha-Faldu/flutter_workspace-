import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:project/user/Registation/registration.dart';
import 'package:project/user/login/login.dart';

class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Enhance Your Skills',
      subTitle:'Join our digital community and collaborate with others who share your interests.',
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      subTitleTextStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
      imageUrl: 'images/onboarding1.png',
    ),
    Introduction(
      title:  'Make Connection Digital',
      subTitle: 'Access resources and tools to improve your digital literacy and stay ahead.',
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      subTitleTextStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
      imageUrl: 'images/onboarding2.png',
    ),
    Introduction(
      title: 'Stay Updated',
      subTitle: 'Get the latest news, trends, and innovations in technology.',
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      subTitleTextStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),
      imageUrl: 'images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
     IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ), //MaterialPageRoute
          );
        },
    );
  }
}