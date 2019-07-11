import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';

class CreateUser extends StatefulWidget {
  @override
  State createState() => _CreateUser();
}

class _CreateUser extends State<CreateUser>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                Translations.of(context).new_user,
                style: TextStyle(
                  color: Color(0xFF37505D),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Form(
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //Name
                      new TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: Translations.of(context).name,
                            hintText: Translations.of(context).em_name,
                            fillColor: Color(0xFF37505D),
                            labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            )),
                        keyboardType: TextInputType.text,
                        validator: (val) => val.contains("@")
                            ? null
                            : Translations.of(context).not_valid_username,
                      ),
                      //Username
                      new TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail_outline),
                            labelText: Translations.of(context).username,
                            hintText: "example@domain.com",
                            fillColor: Color(0xFF37505D),
                            labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            )),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val.contains("@")
                            ? null
                            : Translations.of(context).not_valid_username,
                      ),
                      //Password
                      new TextFormField(
                        scrollPadding: EdgeInsets.all(40.0),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: Translations.of(context).password,
                            fillColor: Color(0xFF37505D),
                            labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            )),
                        obscureText: true,
                        validator: (val) => val.contains("@")
                            ? null
                            : Translations.of(context).password_is_too_short,
                      ),
                      //Re-Password
                      new TextFormField(
                        scrollPadding: EdgeInsets.all(40.0),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: Translations.of(context).re_password,
                            fillColor: Color(0xFF37505D),
                            labelStyle: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            )),
                        obscureText: true,
                        validator: (val) => val.contains("@")
                            ? null
                            : Translations.of(context).password_is_too_short,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      //Register btn
                      MaterialButton(
                        height: 40.0,
                        minWidth: 200.0,
                        color: Color(0xFF00C2E7),
                        splashColor: Color(0xFF009AFF),
                        textColor: Colors.white,
                        child: new Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      new GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/UserLogin');
                        },
                        child: new Text(
                          Translations.of(context).have_account,
                          style: TextStyle(
                            color: Color(0xFF37505D),
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
