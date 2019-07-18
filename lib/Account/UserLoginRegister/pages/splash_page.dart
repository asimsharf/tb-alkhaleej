import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';

import '../pages/LoginPage.dart';
import '../utils/app_shared_preferences.dart';

class SplashPageLoginTow extends StatefulWidget {
  @override
  createState() => new SplashPageLoginTowState();
}

class SplashPageLoginTowState extends State<SplashPageLoginTow> {
  final globalKey = new GlobalKey<ScaffoldState>();

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), _handleTapEvent);
    return new Scaffold(
      key: globalKey,
      body: _splashContainer(),
    );
  }

//------------------------------------------------------------------------------
  Widget _splashContainer() {
    return GestureDetector(
        onTap: _handleTapEvent,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: new BoxDecoration(color: Color(0xFF00C2E7)),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                    child: new Image(
                  height: 200.0,
                  width: 200.0,
                  image: new AssetImage("assets/logo.png"),
                  fit: BoxFit.fill,
                )),
                new Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Text(Translations.of(context).login,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 8.0,
                              color: Color.fromARGB(125, 0, 0, 255),
                            ),
                          ])),
                ),
              ],
            )));
  }

//------------------------------------------------------------------------------
  void _handleTapEvent() async {
    bool isLoggedIn = await AppSharedPreferences.isUserLoggedIn();
    if (this.mounted) {
      setState(() {
        if (isLoggedIn != null && isLoggedIn) {
          Navigator.popAndPushNamed(context, '/MainPage');
        } else {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new LoginPage()),
          );
        }
      });
    }
  }
//------------------------------------------------------------------------------
}
