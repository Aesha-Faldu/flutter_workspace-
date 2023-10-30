// create below pattern
//           *
//         *   *
//       *   *   *
//     *   *   *   *
//   *   *   *   *   *
//


/*
import 'dart:io';

void main() {
  int i,j,num,k;


  print("Enter Any Number");
  num = int.parse(stdin.readLineSync().toString());


  for (int i = 1; i <= num; i++) {

    for (int j = 1; j <= num - i; j++) {
      stdout.write('  ');
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write(' * ');
    }

   print('');
  }
}*/





import 'dart:io';

void main() {

  int num,space,i,j;
  print("Enter number of rows:");
  num = int.parse(stdin.readLineSync().toString());
  for (int i = 1; i <= num; i++) {
    for (int space = 0; space != (num - i); space++) {
      stdout.write(' ');
    }
    for (int j = 1; j <= i; j++) {
      stdout.write("* ");
    }
    print("");
  }
  print("");
}







