/*
create below pattern
        1
      1  2
    1  2  3
  1  2  3  4
1  2  3  4  5
*/



import 'dart:io';

void main() {

  int num,space,i,j;
  print("Enter number of rows:");
  num = int.parse(stdin.readLineSync().toString());
  for (int i = 1; i <= num; i++) {
    for (int space = 0; space != (num - i); space++) {
      stdout.write(' ');
    }
    for (int j = 1; j <= i; j++) {
      stdout.write(" $j ");
    }
    print("");
  }
  print("");
}
