// // Create Below Patterns:
// //  *
// //  * *
// //  * * *
// //  * * * *
// //  * * * * *



// import 'dart:io';
//
// void main()
// {
//   int i,j;
//
//   for(i=1;i<=5;i++)//row
//       {
//     //print("*");
//     for(j=1;j<=i;j++)//col
//         {
//       stdout.write("*");
//     }
//     print("");
//
//   }
//
// }

// Create star  Patterns enter number by user:
//  *
//  * *
//  * * *
//  * * * *
//  * * * * *
import 'dart:io';

void main()
{
  int i,j,num;

  print("Enter Any Number");
  num = int.parse(stdin.readLineSync().toString());

  for(i=1;i<=num;i++)//row
      {
    //print("*");
    for(j=1;j<=i;j++)//col
        {
      stdout.write("*");
    }
    print("");

  }

}