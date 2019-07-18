import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tb_alkhalij/Language/scope_model_wrapper.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/background_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  child: Text(
                    Translations.of(context).title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
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
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    child: Text(
                      Translations.of(context).login,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
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
                          ]),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    color: Color(0xFF00C2E7),
                    textColor: Colors.white,
                    splashColor: Color(0xFF009AFF),
                    onPressed: () {
                      Navigator.pushNamed(context, '/SplashPageLoginTow');
                    },
                  ),
                ),
              ),
              new SizedBox(
                height: 5.0,
              ),
              new Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    child: Text(
                      Translations.of(context).new_user,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
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
                          ]),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    color: Color(0xFF00C2E7),
                    textColor: Colors.white,
                    splashColor: Color(0xFF009AFF),
                    onPressed: () {
                      Navigator.pushNamed(context, '/RegisterPage');
                    },
                  ),
                ),
              ),
              new SizedBox(
                height: 20.0,
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/MainPage');
                  },
                  child: Container(
                    child: Text(
                      Translations.of(context).skip,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
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
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              new SizedBox(
                height: 20.0,
              ),
              new ScopedModelDescendant<AppModel>(
                builder: (context, child, model) => new RaisedButton(
                      child: Text(
                        Translations.of(context).language,
                        style: new TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
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
                            ]),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14.0),
                      ),
                      color: Color(0xFF00C2E7),
                      textColor: Colors.white,
                      splashColor: Color(0xFF009AFF),
                      onPressed: () {
                        model.changeDirection();
                      },
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
