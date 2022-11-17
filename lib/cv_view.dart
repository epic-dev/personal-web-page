import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CVView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "My CV",
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  var url =
                      "https://docs.google.com/document/d/1sZeSPlcCa0MAegiX7e_5cItR4b5T3207D1KFgFMSoxE/edit";
                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
        ])),
      ),
    );
  }
}
