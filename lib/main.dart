import 'dart:ui';

import 'package:cv/about_view.dart';
import 'package:cv/contact_view.dart';
import 'package:cv/cv_view.dart';
import 'package:cv/home_view.dart';
import 'package:cv/side_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CvApp());
}

class CvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pavel Yuruts - Personal page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double asideWidth = 70.0;

  final double activeAasideWidth = 80.0;

  final double mainCardWidth = 1200.0;

  final double mainCardHeight = 700.0;

  final views = [
    HomeView(),
    AboutView(),
    CVView(),
    ContactView(),
  ];

  var selectedView;

  void selectView({int index = 0}) {
    if (index >= views.length) {
      index = 0;
    }
    setState(() {
      selectedView = views[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg-blue.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Card(
                elevation: 8,
                child: SizedBox(
                  width: mainCardWidth,
                  height: mainCardHeight,
                  child: Row(
                    children: [
                      SideBar(
                        width: asideWidth,
                        onSelectItem: selectView,
                      ),
                      // image container
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                          maxWidth: (mainCardWidth - asideWidth - 100) / 2,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.3),
                          ),
                          child: Image.asset(
                            'assets/images/home_image.jpeg',
                            fit: BoxFit.cover,
                            height: mainCardHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: selectedView ?? HomeView(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
