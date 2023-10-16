// Write a Program to check the given year is leap year or not.

void main(){

  int year = 1700;

  if((year%4==0) && (year%400==0) )
      print("$year year is Leapyear");
  else
    print("$year year is  Not Leapyear");
}
// ((year%4==0) && (year%400==0))