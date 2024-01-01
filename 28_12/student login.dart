import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details.dart';


enum gender { Male, Female,Null }

class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
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





  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    // if (_selectedOption == Null) {
    //   _showSnackBar("Please select your gender.");
    //   return false;
    // }

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
      } else {
        submit(
          firstName.text,
          lastName.text,
          password.text,
          confirmPaswd.text,
          email.text,
          _selectedOption,
          one,
          two,
          three,
          dropdownValue,
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Form ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(

            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
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
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
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
                  ),
                ],
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
              Row(
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


              SizedBox(height: 20,),




               Container(
                width: double.infinity,
                height: 50,
                 child: ElevatedButton(
                 onPressed: _onSubmitButtonPressed,
                 child: Text("Submit"),
          ),
        ),

              SizedBox(height: 30),
            ],
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

  void submit(
      String firstName,
      String lastName,
      String password,
      String confirmPaswd,
      String email,
      gender? _selectedOption,
      bool hobbyOne,
      bool hobbyTwo,
      bool hobbyThree,
      String city,
      ) {

      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserDetailsPage(
        firstName: firstName,
        lastName: lastName,
        password: password,
        confirmPaswd: confirmPaswd,
        email: email,
        selectedOption: _selectedOption,
        hobbyOne: hobbyOne,
        hobbyTwo: hobbyTwo,
        hobbyThree: hobbyThree,
        city: city,
      ),
      ),
      );

    print("Form submitted!");
  }
}

