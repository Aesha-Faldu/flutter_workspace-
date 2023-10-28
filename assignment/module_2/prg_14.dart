// Write a program to find the Max number from the given three
// number using Nested If


void main(){

  int a= 10;
  int b=56;
  int c=85;

  if (a >= b && a >= c){
    print(" $a is largest compare to $b&$c");

  } else if (b >= a && b >= c){
     print("$b is largest compare to $a&$c");
  } else {
     print("$c is largest compare to $a & $b");
  }
}