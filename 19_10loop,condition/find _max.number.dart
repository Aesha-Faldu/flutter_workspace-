// write a program to find out the max from given number

import 'dart:io';

void main(){

  int  n1,n2,n3;
  print("enter three value to find max number");
  n1= int.parse(stdin.readLineSync().toString());
  n2= int.parse(stdin.readLineSync().toString());
  n3= int.parse(stdin.readLineSync().toString());

  if(n1>=n2 && n1>=n3){
    print("$n1 is max. number of given value");
  }
  else if(n2>=n3){
    print("$n2 is max. number of given value");
  }
  else{
    print("$n3 is max. number of given value");
  }

}

