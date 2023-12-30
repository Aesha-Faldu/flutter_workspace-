import 'package:callmsg/student%20login.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {

  final String firstName;
  final String lastName;
  final String password;
  final String confirmPaswd;
  final String email;
  final gender? selectedOption;
  final bool hobbyOne;
  final bool hobbyTwo;
  final bool hobbyThree;
  final String city;

  UserDetailsPage({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.confirmPaswd,
    required this.email,
    required this.selectedOption,
    required this.hobbyOne,
    required this.hobbyTwo,
    required this.hobbyThree,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details",
            style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.brown,
    ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First Name: $firstName"),
            Text("Last Name: $lastName"),
            Text("Password: $password"),
            Text("Confirm Password: $confirmPaswd"),
            Text("Email: $email"),
            Text("Gender: ${selectedOption == gender.Male ? 'Male' : 'Female'}"),
            Text("Hobbies: ${hobbyOne ? 'Playing' : ''} ${hobbyTwo ? 'Dancing' : ''} ${hobbyThree ? 'Singing' : ''}"),
            Text("City: $city"),
          ],
        ),
      ),
    );
  }
}

// In the AdminPageState, modify the submit method to navigate to the UserDetailsPage:

