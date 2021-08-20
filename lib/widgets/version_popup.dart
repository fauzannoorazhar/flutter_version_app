import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

class VersionPopup extends StatefulWidget {
  final String androidAppId;
  final String iOSAppId;

  VersionPopup({
    @required this.androidAppId,
    @required this.iOSAppId
  });

  @override
  _VersionPopupState createState() => _VersionPopupState();
}

class _VersionPopupState extends State<VersionPopup> {
  void onButtonUpdate() {
    // TODO : Need to add iOSAppId
    LaunchReview.launch(
      androidAppId: "${widget.androidAppId}",
      iOSAppId: "${widget.iOSAppId}",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AlertDialog(
        title: Text('Update Available', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There is a newer version of app available please update it now.'),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => onButtonUpdate(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0C8160)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
                    child: Text('Update', style: TextStyle(color: Colors.white)),
                  )
              ),
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 1.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset('asset/google_play_logo.png', width: 100),
              ),
            )
          ],
        ),
      );
    } else {
      return CupertinoAlertDialog(
        title: Text('Update Available', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
        content: Text('There is a newer version of app available please update it now.'),
        actions: [
          CupertinoButton(child: Text('Update Now'), onPressed: () => onButtonUpdate()),
        ],
      );
    }
  }
}
