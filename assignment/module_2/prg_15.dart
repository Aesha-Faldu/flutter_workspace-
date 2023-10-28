// Write a program to find the Max number from the given three
// number using Ternary Operator

void main(){

  int a= 82;
  int b=39;
  int c=56;
  int max;

max=(a >= b && a >= c) ? a : (b >= a && b >= c) ? b :c;

print( "maximum number is $max");

}
