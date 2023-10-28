// // write a program to find out the max from given number


import 'dart:io';

int findMaxDigit(int number) {
  int maxDigit = 0;
  while (number != 0) {
    int digit = number % 10;
    if (digit > maxDigit) {
      maxDigit = digit;
    }
    number ~/= 10;
  }
  return maxDigit;
}

void main() {
 print("Enter a number: ");
  var input = stdin.readLineSync();

  if (input != null) {
    var number = int.parse(input);
    if (number != null) {
      var maxDigit = findMaxDigit(number);
      print("Max number is: $maxDigit");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else {
    print("Invalid input. Please enter a number.");
  }
}





