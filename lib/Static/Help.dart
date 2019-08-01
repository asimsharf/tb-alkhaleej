import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  AnimationController _controllers;

  String result;

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          Translations
              .of(context)
              .contact_infos,
          style: TextStyle(
            fontSize: EventSizedConstants.TextappBarSize,
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.white,
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
            ],
          ),
        ),
      ),
      body: new Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: 'assets/logo.png',
                    image: 'assets/logo.png2',
                  ),
                ),
              ),
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              Translations
                                  .of(context)
                                  .phone,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "209384572345",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "الواتساب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "209345875235",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("الموقع الإلكتروني",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF37505D),
                                    fontSize: 14.0)),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "http://tbalkhalij.com/",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(Translations
                                .of(context)
                                .email,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF37505D),
                                    fontSize: 14.0)),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "info@citysoft.com",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("الدولة",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF37505D),
                                    fontSize: 14.0)),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "المملكة العربية السعودية",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("المدينة",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF37505D),
                                    fontSize: 14.0)),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "جدة",
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile image
          new Positioned(
            top: 100.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: new Center(
                      child: new Stack(
                    children: <Widget>[
                      new Center(
                        child: Container(
                          height: 70.0,
                          width: 70.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/logo.png',
                              image: 'assets/logo.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackMakeCall(context),
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.call),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackWhatsAppChat(context),
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(FontAwesomeIcons.whatsapp)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackSendEmail(context),
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.email)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _ChackLanchWebSite(context),
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(FontAwesomeIcons.chrome),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _ChackMakeCall(context) {
    Alert(
      context: context,
      title: "إجراء مكالمة",
      content: Text(
        "هل تريد إجراء مكالمة",
        style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.black,
            fontSize: 20),
      ),
      buttons: [
        DialogButton(
          onPressed: () => launch("tel://0024913000262"),
          color: Color(0xFF13A1C5),
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white,
                fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  _ChackSendEmail(context) {
    Alert(
      context: context,
      title: "إرسال بريد إلكتروني",
      content: Text(
        "هل تريد إرسال بريد إلكتروني؟",
        style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.black,
            fontSize: 20),
      ),
      buttons: [
        DialogButton(
          onPressed: () =>
              launch(
                  "mailto://info@tbalkhalij.com?subject=طلب المساعدة من التطبيق&body=السلام عليكم ورحمة الله "),
          color: Color(0xFF13A1C5),
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white,
                fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  _ChackWhatsAppChat(context) {
    Alert(
      context: context,
      title: "إجراء دردشة واتساب",
      content: Text(
        "هل تريد إجراء دردشة واتساب؟",
        style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.black,
            fontSize: 20),
      ),
      buttons: [
        DialogButton(
          onPressed: () => launch("whatsapp://send?phone=+249913000262"),
          color: Color(0xFF13A1C5),
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white,
                fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  _ChackLanchWebSite(context) {
    Alert(
      context: context,
      title: "الذهاب إلى الموقع",
      content: Text(
        "هل تريد الذهاب الى الموقغ؟",
        style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.black,
            fontSize: 20),
      ),
      buttons: [
        DialogButton(
          onPressed: () => launch("http://tbalkalij.com/"),
          color: Color(0xFF13A1C5),
          child: Text(
            "موافق",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white,
                fontSize: 20),
          ),
        ),
      ],
    ).show();
  }
}
