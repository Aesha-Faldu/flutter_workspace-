// // import 'dart:io';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:sqflite/sqflite.dart' as sql;
// //
// // class AudioUploader extends StatefulWidget {
// //   @override
// //   _AudioUploaderState createState() => _AudioUploaderState();
// // }
// //
// // class _AudioUploaderState extends State<AudioUploader> {
// //   String? _filePath;
// //
// //   Future<void> pickAudio() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       type: FileType.audio,
// //       allowMultiple: false,
// //     );
// //
// //     if (result != null) {
// //       setState(() {
// //         _filePath = result.files.single.path!;
// //       });
// //     } else {
// //       // User canceled the picker
// //     }
// //   }
// //
// //   Future<void> saveAudio() async {
// //     if (_filePath != null) {
// //       Directory? appDocDir = await getApplicationDocumentsDirectory();
// //       String? appDocPath = appDocDir?.path;
// //
// //       if (appDocPath != null) {
// //         File file = File(_filePath!);
// //         File newFile = await file.copy('$appDocPath/${file.path.split('/').last}');
// //
// //         setState(() {
// //           _filePath = newFile.path;
// //         });
// //
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text('Audio saved to $appDocPath'),
// //           ),
// //         );
// //       }
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Audio Uploader'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: pickAudio,
// //               child: Text('Select Audio'),
// //             ),
// //             SizedBox(height: 20),
// //             _filePath != null
// //                 ? Column(
// //               children: [
// //                 Text('Selected Audio:'),
// //                 SizedBox(height: 10),
// //                 Text(_filePath!),
// //                 SizedBox(height: 20),
// //                 ElevatedButton(
// //                   onPressed: saveAudio,
// //                   child: Text('Save Audio'),
// //                 ),
// //               ],
// //             )
// //                 : Container(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'database.dart';
// import 'homePage.dart';
//
// class AudioUploader extends StatefulWidget {
//   @override
//   _AudioUploaderState createState() => _AudioUploaderState();
// }
//
// class _AudioUploaderState extends State<AudioUploader> {
//   String? _filePath;
//
//   Future<void> pickAudio() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.audio,
//       allowMultiple: false,
//     );
//
//     if (result != null) {
//       setState(() {
//         _filePath = result.files.single.path!;
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
//
//   Future<void> saveAudio() async {
//     if (_filePath != null) {
//       Directory? appDocDir = await getApplicationDocumentsDirectory();
//       String? appDocPath = appDocDir?.path;
//
//       if (appDocPath != null) {
//         File file = File(_filePath!);
//         File newFile = await file.copy('$appDocPath/${file.path.split('/').last}');
//
//         // Save audio information to the database
//         // String title = file.path.split('/').last; // You can change this to a more appropriate title
//         // String? desc = ''; // Add description if needed
//         // String bookLogo = ''; // Add logo path if needed
//         // await SQLiteDatabase.createData(title, desc, bookLogo);
//
//         setState(() {
//           _filePath = newFile.path;
//         });
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Audio Upload SuccessFully'),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Uploader'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: pickAudio,
//               child: Text('Select Audio'),
//             ),
//             SizedBox(height: 20),
//             _filePath != null
//                 ? Column(
//               children: [
//                 Text('Selected Audio:'),
//                 SizedBox(height: 10),
//                 Text(_filePath!),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed:(){ saveAudio();
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                   },
//
//                   child: Text('Save Audio'),
//                 ),
//               ],
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'database.dart';
import 'homePage.dart';


class AudioUploader extends StatefulWidget {
  @override
  _AudioUploaderState createState() => _AudioUploaderState();
}

class _AudioUploaderState extends State<AudioUploader> {
  String? _filePath;

  Future<void> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    } else {
      // User canceled the picker
    }
  }
  Future<void> saveAudio() async {
    if (_filePath != null) {
      Directory? appDocDir = await getApplicationDocumentsDirectory();
      String? appDocPath = appDocDir?.path;

      if (appDocPath != null) {
        File file = File(_filePath!);
        File newFile = await file.copy('$appDocPath/${file.path.split('/').last}');

        String title = file.path.split('/').last;
        String? desc = ''; // You can add a description if needed
        String bookLogo = ''; // You can add a logo path if needed
        // Save audio information to the database
        await SQLiteDatabase.createData(title,desc,bookLogo);

        setState(() {
          _filePath = newFile.path;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Audio Upload Successfully'),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Uploader',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickAudio,
              child: Text('Select Audio'),
            ),
            SizedBox(height: 20),
            _filePath != null
                ? Column(
              children: [
                Text('Selected Audio:'),
                SizedBox(height: 10),
                Text(_filePath!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await saveAudio();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text('Save Audio'),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
