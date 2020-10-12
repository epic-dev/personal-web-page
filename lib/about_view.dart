import 'dart:ui';

import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _TextParagraph(
            'I\'m a Front End developer. Experienced in JavaScript, HTML, CSS and related frameworks such as Angular and React.'),
        SizedBox(height: 25),
        _TextParagraph('Recently, I started to learn Flutter. I use it for developing mobile and web apps.'),
        SizedBox(height: 25),
        _TextParagraph('This website is written in Flutter and hosted on Firebase Hosting'),
      ],
    );
  }
}

class _TextParagraph extends StatelessWidget {
  final String text;

  _TextParagraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      '    $text',
      style: TextStyle(fontSize: 16, fontFamily: 'SourceCodePro'),
      textAlign: TextAlign.left,
    );
  }
}
