// write a program you have to find the factorial of given number.


import 'dart:io';

void main(){

  print("Enter Number");
  int Number = int.parse(stdin.readLineSync().toString());

  // int Number = stdin.readLineSync() as int;

  int result = 1;
  for(int i = 1; i<= Number; i++){
    result *= i;

  }
  print("factorial of $Number");
  print("$result");


}














