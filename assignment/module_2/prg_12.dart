// Write a Program to check the given year is leap year or not.

import 'dart:io';

void main(){

  int year =2004 ;

  if(year%400 != 0 && year%100 == 0 || year % 4 != 0 ) {
    print("$year year is  Not Leapyear");
  } else {
    print("$year year is Leapyear");
  }
}
