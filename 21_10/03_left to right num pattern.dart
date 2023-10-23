// // Create Below Patterns:
// //  1
// //  2 2
// //  3 3 3
// //  4 4 4 4
// //  5 5 5 5 5
//
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
//       stdout.write("$i");
//     }
//     print("");
//
//   }
//
// }




// // Create number Patterns & number enter by user:

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
      stdout.write("$i");
    }
    print("");

  }

}