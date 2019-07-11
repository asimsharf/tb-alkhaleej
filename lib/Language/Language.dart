import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tb_alkhalij/Language/scope_model_wrapper.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Translations.of(context).select_language,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          ),
        ),
        body: new ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => Container(
                height: 60.0,
                child: new InkWell(
                  splashColor: Color(0xFF009AFF),
                  onTap: () {
                    model.changeDirection();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xFFDFDAD6),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            5.0), //   ,      <--- border radius here
                      ),
                    ),
                    child: new Text(
                      Translations.of(context).language,
                      style: new TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),
        ));
  }
}
