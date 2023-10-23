// Write a program make a summation of given number(E.g. 1523 ans :-11)

import 'dart:io';

void main(){

print("Please Enter Number ");
int n1,answer =0;

n1 = int.parse(stdin.readLineSync().toString());

while(n1 != 0){

answer += n1%10;

double n2 = n1/10;

n1 = n2.toInt();
}
print("Summation is $answer.");

}