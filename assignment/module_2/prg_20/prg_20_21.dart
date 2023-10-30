// Create Below Patterns:
//    1
//    0 1
//    1 0 1
//    0 1 0 1
//    1 0 1 0 1

import 'dart:io';

void main(){
  int num,i,j;
  print(" Enter Number:");
  num = int.parse(stdin.readLineSync().toString());
  for(int i=1; i<=num; i++){
    for(int j=1; j<=i; j++){
      if ((i + j) % 2 == 0) {
        stdout.write(" 1 ");
      } else {
        stdout.write(" 0 ");
      }
    }
    print('');
  }
}