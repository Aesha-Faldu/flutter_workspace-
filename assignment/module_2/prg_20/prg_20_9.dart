// Write a program make a summation of given number
// (E.g. 1523 ans :-11)


import 'dart:io';

int sumOfDigits(int number) {
  int sum = 0;
  while (number != 0) {
    sum += number % 10;
    number ~/= 10;
  }
  return sum;
}

void main() {
  print("Enter a number: ");
  var input = stdin.readLineSync();

  if (input != null) {
    var number = int.parse(input);
    if (number != null) {
      var result = sumOfDigits(number);
      print("Sum of the digits: $result");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else {
    print("Invalid input. Please enter a number.");
  }
}