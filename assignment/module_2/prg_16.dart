// Write a program user enter the 5 subjects mark. You have to make a
// total and find the percentage. percentage > 75 you have to print
// “Distinction” percentage > 60 and percentage you have to
// print “First class” percentage >50 and percentage <= 60 you have to
// print “Second class” percentage > 35 and percentage <= 50 you have to
// print “Pass class” Otherwise print “Fail”

void main(){

  int android=85, php=75 , python=63 , c=83, java=79;
  int sum= android + php + python + c + java;
  double percentage;

  percentage=(sum)/5;
  print("Total is $sum");
  print("percentage is $percentage");

  if(percentage >75 ) {

    print("Distinction");

  } else if (percentage > 60 && percentage <= 75 ){

    print("First class");

  } else if (percentage >50 && percentage <= 60){
    print("Second class");

  }else if (percentage > 35 && percentage <= 50 ){
    print("Pass class");
  }else{
    print("fail");
  }

}