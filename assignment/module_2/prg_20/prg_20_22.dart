// create below pattern
// 1
// 4 4
// 9 9 9
// 16 16 16 16

import 'dart:io';

void main() {
  int num; // Number of rows in the pattern
  print("Enter number");
 num= int.parse(stdin.readLineSync().toString());
  for (int i = 1; i <= num; i++) {
    for (int j = 1; j <= i; j++) {
      int value = i * i;
      if (j == i) {
        print('$value');
      } else {
        stdout.write('$value ');
      }
    }
  }
}
