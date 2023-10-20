//write a program to print the number in reverse order.
import 'dart:io';

void main(){

  print(" enter numbet for print reverse value ");
  int num = int.parse(stdin.readLineSync().toString());
  print("reverse order $num is");
  for(int i = num ; i>=0; i--){
    print(i);
  }

}