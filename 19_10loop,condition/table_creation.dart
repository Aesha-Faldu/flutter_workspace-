// write a program you have to print the table of given number.

import 'dart:io';

void main(){

  print("enter Number");
  int num = int.parse(stdin.readLineSync().toString());

  print("number of table $num");
  for(int i=1; i<=10;i++){
    int table = i*num;
    print("$num = $num X $i = $table");

  }
}
