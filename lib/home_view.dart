import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pavel Yuruts',
              style: TextStyle(
                fontFamily: 'Cinzel',
                color: Colors.indigo,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontFamily: 'SourceCodePro',
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w300,
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 35),
            Text(
              'Hello! Nice to meet you here!',
              style: TextStyle(
                fontFamily: 'SourceCodePro',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
