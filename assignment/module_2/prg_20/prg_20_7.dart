// Write a program to print the number in reverse order.

import 'dart:io';

void main() {
  print("Enter a number: ");
  var input = stdin.readLineSync();

  if (input != null) {
    var reversedNumber = input.split('').reversed.join();
    print("Number in reverse order: $reversedNumber");
  } else {
    print("Invalid input. Please enter a number.");
  }
}
