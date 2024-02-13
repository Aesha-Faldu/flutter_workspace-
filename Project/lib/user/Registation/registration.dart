import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../login/login.dart';


enum gender { Male, Female,Null }

class register extends StatefulWidget {
  @override
  registerState createState() => registerState();
}
class registerState extends State<register> {

  final _formKey = GlobalKey<FormState>();

  bool one = false;
  bool two = false;
  bool three = false;

  gender _selectedOption = gender.Null ;

  String dropdownValue = 'Ahemdabad';

  TextEditingController lastName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPaswd = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController monum = TextEditingController();

  CarouselController buttonCarouselController = CarouselController();
  var identifier = "User";
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    if (!(one || two || three)) {
      _showSnackBar("Please select at least one hobby.");
      return false;
    }

    return true;
  }

  void _onSubmitButtonPressed() {
    if (_validateForm()) {
      if (_selectedOption == gender.Null) {
        _showSnackBar("Please select your gender.");
      } else{

        List<String> selectedHobbiesList = [];
        if (one) selectedHobbiesList.add("Playing");
        if (two) selectedHobbiesList.add("Dancing");
        if (three) selectedHobbiesList.add("Singing");
        var url = Uri.parse("https://topsapi.000webhostapp.com/Flutter_Task/register.php");
        http.post(url,
            body:
            {
              "firstname":firstName.text.toString(),
              "lastname":lastName.text.toString(),
              "password":password.text.toString(),
              "confirm_password":confirmPaswd.text.toString(),
              "email":email.text.toString(),
              "phone":monum.text.toString(),
              "gender": _selectedOption.toString(),
              "hobbies": selectedHobbiesList.join(', '),
              "city": dropdownValue,
              "identifier": identifier,
            });
        Fluttertoast.showToast(msg: "Registration Successfully Completed",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SuccessClub Society", // Update the app bar title
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown.shade400, // Change the background color
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    "Registration Form",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.brown.shade300,
                      decoration: TextDecoration.none, // Add underline decoration
                      decorationColor: Colors.white, // Set underline color
                      decorationThickness: 2, // Set underline thickness
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                        ), // Add shadow for a more appealing look
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    controller: firstName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Enter  your FirstName",
                      prefixIcon: Icon(Icons.person),
                    ),
                    onFieldSubmitted: (value) {
                      firstName.text = value.toString();
                    },
                    onSaved: (value) {
                      firstName.text = value.toString();
                    },
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return "Enter your First Name";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(
                      labelText: "Enter your LastName",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      lastName.text = value.toString();
                    },
                    onSaved: (value) {
                      lastName.text = value.toString();
                    },
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20,),

                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Enter  your Password",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: (){
                          setState(() {
                            _isObscurePassword = !_isObscurePassword;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock),

                    ),
                    onFieldSubmitted: (value) {
                      password.text = value.toString();
                    },
                    onSaved: (value) {
                      password.text = value.toString();
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Enter your Password";
                      }

                      if (!isValidPassword(value.toString())) {
                        return "Password must have at least 6 characters, including uppercase, lowercase, digit, and special character.";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    controller: confirmPaswd,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter your ConfirmPassword",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: (){
                          setState(() {
                            _isObscureConfirmPassword = !_isObscureConfirmPassword;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      confirmPaswd.text = value.toString();
                    },
                    onSaved: (value) {
                      confirmPaswd.text = value.toString();
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Enter Confirm Password";
                      }
                      if (value != password.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter  your Email",
                      prefixIcon: Icon(Icons.mail),
                    ),
                    onFieldSubmitted: (value) {
                      email.text = value.toString();
                    },
                    onSaved: (value) {
                      email.text = value.toString();
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Enter your Email";
                      }
                      if (!isValidEmail(value.toString())) {
                        return "Enter a valid Email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  TextFormField(
                    controller: monum,
                    decoration: InputDecoration(
                      labelText: "Enter your MobileNumber",
                      prefixIcon: Icon(Icons.phone_callback_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),

                    keyboardType: TextInputType.number,  // Specify the number keyboard
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,  // Allow only numeric input
                      LengthLimitingTextInputFormatter(10),  // Limit to 10 characters
                    ],



                    onFieldSubmitted: (value) {
                      monum.text = value.toString();
                    },
                    onSaved: (value) {
                      monum.text = value.toString();
                    },
                    validator: (value) {
                      if (value
                          .toString()
                          .isEmpty) {
                        return "Enter MobileNumber";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['Ahemdabad', 'Rajkot', 'Baroda', 'Junagadh']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),

                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Text("Gender:"),
                      SizedBox(width: 50),
                      Row(
                        children: [
                          Radio(
                            value: gender.Male,
                            groupValue: _selectedOption,
                            onChanged: (gender? value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          Text("Male"),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Radio(
                            value: gender.Female,
                            groupValue: _selectedOption,
                            onChanged: (gender? value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                          Text("Female"),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Hobbies:"),
                        SizedBox(width: 20,),
                        Checkbox(
                          value: one,
                          onChanged: (bool? value) {
                            setState(() {
                              one = value!;
                            });
                          },
                        ),
                        Text("Playing"),
                        SizedBox(width: 10),
                        Checkbox(
                          value: two,
                          onChanged: (bool? value) {
                            setState(() {
                              two = value!;
                            });
                          },
                        ),
                        Text("Dancing"),
                        SizedBox(width: 10),
                        Checkbox(
                          value: three,
                          onChanged: (bool? value) {
                            setState(() {
                              three = value!;
                            });
                          },
                        ),
                        Text("Singing"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:_onSubmitButtonPressed,
                      child: Text("Signup"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade300,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Already have an account? Login here",
                      style: TextStyle(color: Colors.brown.shade900),
                    ),
                  ),

                  SizedBox(height: 30),


                ],
              ),
            ),
          ),
        ),
    );
  }
  bool isValidPassword(String password) {
    final RegExp passwordRegex =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{6,}$');
    return passwordRegex.hasMatch(password);
  }
  bool isValidEmail(String email) {
    final RegExp emailRegex =
    RegExp(r'^[a-z0-9._-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}

