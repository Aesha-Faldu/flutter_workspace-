// // Create Below Patterns & number enetr by user:
// //          1
// //        2 1
// //      3 2 1
// //    4 3 2 1
// //  5 4 3 2 1
//
// import 'dart:io';
//
// void main()
// {
// int i,j,space,num;
//
// print("Enter Any Number");
// num = int.parse(stdin.readLineSync() . toString());
//
// for(i=1;i<=num;i++)//row
//     {
// for(space=0;space!=(num-i);space++)
// {
// stdout.write(" ");
// }
// for(j=1;j<=i;j++)//col
//     {
// stdout.write("$i");
// }
// print("");
//
// }
//
// }


// Create rtl number  Patterns:
//          1
//        2 2
//      3 3 3
//    4 4 4 4
//  5 5 5 5 5

import 'dart:io';

void main()
{
  int i,j,space;


  for(i=1;i<=5;i++)//row
      {
    for(space=0;space!=(5-i);space++)
    {
      stdout.write(" ");
    }
    for(j=1;j<=i;j++)//col
        {
      stdout.write("$i");
    }
    print("");

  }

}