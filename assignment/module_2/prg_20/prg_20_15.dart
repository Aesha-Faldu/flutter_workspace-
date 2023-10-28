// Create Below Patterns & number enetr by user:
//          1
//        2 1
//      3 2 1
//    4 3 2 1
//  5 4 3 2 1
//
// import 'dart:io';
//
// void main()
// {
//   int i,j,space;
//
//
//   for(i=1;i<=5;i++)
//       {
//     for(space=0;space!=(5-i);space++)
//     {
//       stdout.write(" ");
//     }
//     for(j=1;j<=i;j++)
//         {
//       stdout.write("$j");
//     }
//     print("");
//
//   }
//
// }


import 'dart:io';

void main() {
  int i, j, space;

  for (i = 1; i <= 5; i++) {
    for (space = 0; space != (5 - i); space++) {
      stdout.write(" ");
    }
    for (j = 1; j <= i; j++) {
      stdout.write("$j");
    }
    print("");
  }
}

