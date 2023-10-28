// Write a program you have to make a summation of first and last Digit.
// (E.g. 1234 ans:-5)



import 'dart:io';

int sumOfFirstAndLastDigits(int number) {
  int lastDigit = number % 10;
  int firstDigit = 0;

  while (number >= 10) {
    number ~/= 10;
  }

  firstDigit = number;

  return firstDigit + lastDigit;
}

void main() {
  print("Enter a number: ");
  var input = stdin.readLineSync();

  if (input != null) {
    var number = int.parse(input);
    if (number != null) {
      var result = sumOfFirstAndLastDigits(number);
      print("Sum of the first and last digits: $result");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else {
    print("Invalid input. Please enter a number.");
  }
}
