// // Create Below Patterns:
// //          *
// //        * *
// //      * * *
// //    * * * *
// //  * * * * *
// 4
// import 'dart:io';
//
// void main()
// {
//   int i,j,space,num;
//
//   print("Enter Any Number");
//   num = int.parse(stdin.readLineSync() . toString());
//
//   for(i=1;i<=num;i++)
//       {
//     for(space=0;space!=(num-i);space++)
//     {
//       stdout.write(" ");
//     }
//     for(j=1;j<=i;j++)
//         {
//       stdout.write("*");
//     }
//     print("");
//
//   }
//
// }


// Create Below Patterns:
//          *
//        * *
//      * * *
//    * * * *
//  * * * * *

import 'dart:io';

void main()
{
int i,j,space;



for(i=1;i<=5;i++)
    {
for(space=0;space!=(5-i);space++)
{
stdout.write(" ");
}
for(j=1;j<=i;j++)
    {
stdout.write("*");
}
print("");

}

}