import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/utils/app_shared_preferences.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/api/Rating_api_response.dart';
import 'package:tb_alkhalij/model/Post.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class Rating extends StatefulWidget {
  final String id;
  final String centerId;
  final String name;
  final String logo;
  final Future<Post> post;

  Rating({this.id, this.centerId, this.name, this.logo, this.post});

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  TextEditingController addReviewController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var rating = 1.0;

  var userId;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (userId == null) {
      await initUserProfile();
    }
  }

  Future<void> initUserProfile() async {
    String userI = await AppSharedPreferences.getFromSession('userId');
    setState(
      () {
        userId = userI;
      },
    );
  }

  @override
  initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text(
              widget.name,
              overflow: TextOverflow.ellipsis,
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
            centerTitle: true,
            pinned: true,
            floating: false,
            expandedHeight: 256,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/avatar_person.png',
                    image:
                        'http://23.111.185.155:3000/uploads/files/${widget.logo}',
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Colors.black54, Color(0x00000000)],
                          stops: [0.0, 2.0],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          tileMode: TileMode.mirror),
                    ),
                  ),
                  new Positioned(
                    bottom: 20,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 0.9],
                          colors: [
                            Colors.white10,
                            Colors.white12,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      //color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: SmoothStarRating(
                        allowHalfRating: false,
                        rating: 3.2,
                        size: 25,
                        color: Colors.yellow,
                        borderColor: Colors.grey,
                        starCount: 5,
                        onRatingChanged: (value) {
                          setState(
                            () {
                              rating = value;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new SizedBox(
                      height: 20.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new SmoothStarRating(
                              allowHalfRating: true,
                              rating: rating,
                              size: 50,
                              color: Colors.yellow,
                              starCount: 5,
                              borderColor: Colors.yellow,
                              onRatingChanged: (value) {
                                setState(
                                  () {
                                    rating = value;
                                    print(rating);
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    new SizedBox(
                      height: 20.0,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Divider(
                          color: Color(0xFF13A1C5),
                          height: 1.0,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(20.0),
                      child: new TextField(
                        controller: addReviewController,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          hintText: Translations.of(context).add_rating_review,
                          hintStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                          ),
                        ),
                        maxLines: 10,
                      ),
                    ),
                    new Container(
                      width: 350.0,
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new MaterialButton(
                              onPressed: () => _submitForm(),
                              color: Color(0xFF13A1C5),
                              splashColor: Color(0xFF009AFF),
                              textColor: Colors.white,
                              elevation: 0.2,
                              child: new Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  Translations.of(context).add_rating,
                                  style: TextStyle(
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic',
                                    fontSize:
                                        EventSizedConstants.TextButtonFontSized,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      new Shadow(
                                        offset: Offset(3.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      new Shadow(
                                        offset: Offset(3.0, 3.0),
                                        blurRadius: 8.0,
                                        color: Color.fromARGB(125, 0, 0, 255),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (addReviewController.text.isNotEmpty) {
      Post newPost = new Post(
        centerId: "${widget.centerId}",
        patientId: userId,
        comment: addReviewController.text,
        rate: rating.toString(),
      );
      var createRate = new Rating_api_response();
      createRate.createPost(newPost).then(
            (value) => showMessage(
                  Translations.of(context).thanks_for_rating,
                  Colors.blue,
                ),
          );

      Timer(
        Duration(seconds: 2),
        () {
          Navigator.pop(context);
        },
      );
    } else {
      showMessage(Translations.of(context).please_add_rating, Colors.red);
      FocusScope.of(context).requestFocus(
        new FocusNode(),
      );
      return;
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: color,
        content: new Text(
          message,
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
    );
  }
}
