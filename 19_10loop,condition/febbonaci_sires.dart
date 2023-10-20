//  Write a program you have to print the Fibonacci series up to user given


import 'dart:io';

void main(){

  int n1=0, n2=1,n3,i,number;
  print("Enter Number");
  int Number = int.parse(stdin.readLineSync().toString());

  print("$n1");
  print("$n2");

  for(i=2; i<=Number; i++){

    n3= n1+n2;
    print("$n3");

    n1=n2;
    n2=n3;
  }

}
