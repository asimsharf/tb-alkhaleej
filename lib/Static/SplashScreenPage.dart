import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/homepage.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new HomePage(),
      photoSize: 80.0,
      loaderColor: Colors.white,
      image: Image.asset("assets/logo.png"),
      gradientBackground: new LinearGradient(
          colors: [Color(0xFF13A1C5), Color(0xFF13A1C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      title: Text(Translations.of(context).tb_alkalij,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
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
      loadingText: Text(Translations.of(context).loading,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
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
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => print("Tb Alkhalij"),
    );
  }
}
