// create a Phone call App when user first time open the app it will
// automatically generate one dialog which has two option allow, deny if
// click on allow permission is grant in settings



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneCall extends StatefulWidget {
  @override
  PhoneCallState createState() => PhoneCallState();
}

class PhoneCallState extends State<PhoneCall> {
  @override
  void initState() {
    super.initState();
    _requestPhoneCallPermission();
  }

  Future<void> _requestPhoneCallPermission() async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      // Permission granted, proceed with the app logic
    } else if (status.isDenied) {
      // Permission denied
      // You can show a dialog or navigate to settings
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Permission Required'),
          content: Text('This app requires phone call permission to function.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Deny'),
            ),
            TextButton(
              onPressed: () {
                // Open app settings
                openAppSettings();
              },
              child: Text('Allow in Settings'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call App'),
      ),
      body: Center(
        child: Text('Your app content goes here!'),
      ),
    );
  }
}