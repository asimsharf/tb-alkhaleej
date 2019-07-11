import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:splashscreen/splashscreen.dart';
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
          colors: [Color(0xFF00C5C6), Color(0xFF00C5C6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      title: Text("تطبيق طب الخليج",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold)),
      loadingText: Text("يتم التحميل الأن...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          )),
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => print("Tb Alkhalij"),
    );
  }
}
