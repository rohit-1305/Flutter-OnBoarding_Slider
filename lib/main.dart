import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App OnBoarding',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text('Skip'),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndicator(true)
                            : pageIndicator(false),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              height: Platform.isIOS ? 70 : 60,
              color: Colors.grey[200],
              child: Text('Get Started'),
            ),
    );
  }
}

// ignore: must_be_immutable
class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(imageAssetPath),
        SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    );
  }
}
