import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'login.dart';


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
            });
        print('Inserted');
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));
      }
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Digital Society ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
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
                Padding(
                  padding:EdgeInsets.all(30),
                  child: CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/slide1.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/slide2.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/slide3.jpg'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                    options: CarouselOptions(
                      height: 100.0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                    carouselController: buttonCarouselController,
                  ),
                ),


                    TextFormField(
                        controller: firstName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.brown),
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
                            borderSide: BorderSide(color: Colors.brown),
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
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          labelText: "Enter  your Password",
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
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.brown),
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
                      borderSide: BorderSide(color: Colors.brown),
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
                DropdownButton<String>(
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
                  ),
                ),
                SizedBox(height: 30),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Already have an account? Login here",
                    style: TextStyle(color: Colors.blue),
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

