import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class CentersDetails extends StatefulWidget {
  int center_id;
  int admin_id;
  String address;
  String center;
  String longitude;
  String latitude;
  String description;
  String logo;
  String profile;
  String join_date;
  String open_at;
  String close_at;
  String website;
  String facebook;
  String google;
  String twitter;
  String linkedin;
  String administrator;
  String identity_number;
  String phone;
  String email;
  String admin_join_date;
  String Expire_from;
  String Expire_to;
  String license;
  String country_ar;
  String country_en;
  String country_code;
  String city_ar;
  String city_en;
  String type_ar;
  String type_en;
  CentersDetails({
    this.center_id,
    this.address,
    this.latitude,
    this.longitude,
    this.center,
    this.description,
    this.logo,
    this.profile,
    this.join_date,
    this.open_at,
    this.close_at,
    this.website,
    this.facebook,
    this.google,
    this.twitter,
    this.linkedin,
    this.admin_id,
    this.administrator,
    this.identity_number,
    this.phone,
    this.email,
    this.admin_join_date,
    this.Expire_from,
    this.Expire_to,
    this.license,
    this.country_ar,
    this.country_en,
    this.country_code,
    this.city_ar,
    this.city_en,
    this.type_ar,
    this.type_en,
  });
  @override
  _CentersDetailsState createState() => _CentersDetailsState();
}

class _CentersDetailsState extends State<CentersDetails> {
  var rating = 1.2;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 256,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/logo.png',
                    image: '${widget.profile}',
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
                  Positioned(
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
                          rating: 3.2,
                          size: 25,
                          color: Colors.yellow,
                          borderColor: Colors.grey,
                          starCount: 5,
                          onRatingChanged: (value) {
                            setState(() {
                              rating = value;
                            });
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20.0,
                      ),
                      Expanded(
                        child: Text(
                          widget.address,
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      new FlatButton(
                        onPressed: () => _ShowRattingAlert(),
                        child: new Text(
                          'تقييم',
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              color: Color(0xFFE91E63),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      TextIcon(
                        text: widget.open_at,
                        icon: Icons.access_time,
                        isColumn: true,
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.type_ar,
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      TextIcon(
                        text: "${1.5} km",
                        icon: Icons.location_on,
                        isColumn: false,
                      ),
                    ],
                  ),
                ),
                new Container(
                    color: Colors.grey,
                    height: 220.0,
                    child: Image.network(
                      'http://blog.praguemorning.cz/wp-content/uploads/2017/01/Schermata-2017-01-20-alle-17.03.08.png',
                      fit: BoxFit.fill,
                    )),
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
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => CenterDoctors(
//                            center_id: widget.center_id,
//                            center: widget.center,
//                          ),
//                    ),
//                  );
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("الأطباء",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          fontSize: 20.0,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => CenterDepartment(
//                            center_id: widget.center_id,
//                            center: widget.center,
//                          ),
//                    ),
//                  );
                },
                color: Color(0xFFE91E63),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("التخصصات",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _ShowRattingAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("تقييم",
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                            rating: rating,
                            size: 30,
                            color: Colors.yellow,
                            starCount: 5,
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "إضافة ملاحظة",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                          )),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE91E63),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "إضافة تقيم",
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
