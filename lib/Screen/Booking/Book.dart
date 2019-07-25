import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Booking/ConfirmBooking.dart';
import 'package:tb_alkhalij/model/ModelRating.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class Book extends StatefulWidget {
  final String id;
  final String centerId;
  final String departmentId;
  final String name;
  final String email;
  final String description;
  final String close;
  final String open;
  final String lat;
  final String lang;
  final bool isActive;
  final bool inviled;
  final String centerType;
  final String country;
  final String postcode;
  final String state;
  final String street1;
  final String suburb;
  final String logo;
  final List committee;
  final List days;

  Book({
    this.id,
    this.centerId,
    this.departmentId,
    this.name,
    this.email,
    this.description,
    this.close,
    this.open,
    this.lang,
    this.lat,
    this.isActive,
    this.inviled,
    this.country,
    this.postcode,
    this.state,
    this.street1,
    this.suburb,
    this.centerType,
    this.logo,
    this.committee,
    this.days,
  });

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  static const int monday = 1;
  static const int tuesday = 2;
  static const int wednesday = 3;
  static const int thursday = 4;
  static const int friday = 5;
  static const int saturday = 6;
  static const int sunday = 7;
  static const int daysPerWeek = 7;

  var weekdays;

  _weekdays(dateTime) {
    switch (DateTime
        .now()
        .weekday) {
      case 1:
        {
          weekdays = 'الاثنين';
        }
        break;

      case 2:
        {
          weekdays = 'الثلاثاء';
        }
        break;

      case 3:
        {
          weekdays = 'الاربعاء';
        }
        break;

      case 4:
        {
          weekdays = 'الخميس';
        }
        break;
      case 5:
        {
          weekdays = 'الجمعه';
        }
        break;
      case 6:
        {
          weekdays = 'السبت';
        }
        break;
    }
    return weekdays;
  }

  //########################################################################
  String _myInsuranceSelection;

  bool loading = false;
  List<ModelRating> _modelRating = <ModelRating>[];

  Future<List<ModelRating>> getRatings() async {
    String link =
        "http://23.111.185.155:3000/api/rating/${widget.centerId}/center";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['Rating'] as List;
        _modelRating = rest
            .map<ModelRating>((rest) => ModelRating.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _modelRating;
  }

  var rating = 1.2;

  @override
  void initState() {
    super.initState();
    this.getRatings();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBookingDateTimeList() {
      Widget _bookingDateTimeList;
      _bookingDateTimeList = new ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(1.0),
        shrinkWrap: true,
        itemCount: widget.days.length,
        itemBuilder: (BuildContext context, int i) {
          final _listOfDays = widget.days[i];
          return new Container(
            height: 160.0,
            width: 100.0,
            color: Colors.blueAccent,
            margin: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
//                        "${_weekdays(DateTime.now().weekday)} - ${DateTime.now().day} - ${DateTime.now().month}",
                        "${_listOfDays['name']}",
                        style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
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
                  ],
                ),
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'من ${widget.open.substring(11, 16)}ص \n الى ${widget
                          .close.substring(11, 16)}م',
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(
                      child: new MaterialButton(
                        height: 10.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmBooking(
                                    centerId: widget.centerId,
                                    departmentId: widget.departmentId,
                                    committee: _myInsuranceSelection,
                                    bookingDay: _listOfDays['name'],
                                  ),
                            ),
                          );
                        },
                        color: Color(0xFF13A1C5),
                        splashColor: Color(0xFF009AFF),
                        textColor: Colors.white,
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: new Text("حجز",
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
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
                                  ])),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
      return _bookingDateTimeList;
    }

    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text(
              'حجز موعد في قسم ${widget.name}',
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                fontSize: EventSizedConstants.TextappBarSize,
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
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
            centerTitle: true,
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
                    image:
                        'http://23.111.185.155:3000/uploads/department/${widget.logo}',
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
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${widget.description}',
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            fontSize: 14.0,
                            package: 'google_fonts_arabic',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                //committee
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          Translations.of(context).insurances,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            fontSize: EventSizedConstants.TextTitleFontSized,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: new FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            errorText: state.hasError ? state.errorText : null,
                          ),
                          // ignore: unrelated_type_equality_checks
                          isEmpty: widget.committee == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              isDense: true,
                              isExpanded: true,
                              items: widget.committee.map((dynamic item) {
                                return new DropdownMenuItem(
                                  child: new Text(
                                    item['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  value: item['_id'].toString(),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  _myInsuranceSelection = newVal;
                                  state.didChange(newVal);
                                });
                              },
                              value: _myInsuranceSelection,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                new SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          new SliverList(
            delegate: SliverChildListDelegate(
              [
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text(
                          'تاريخ الحجز',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            fontSize: EventSizedConstants.TextTitleFontSized,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 160.0,
                    width: 100.0,
                    child: _buildBookingDateTimeList(),
                  ),
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
                onPressed: _showModalSheet,
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("تقييمات المرضى",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: EventSizedConstants.TextButtonFontSized,
                          fontWeight: FontWeight.bold,
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
                          ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Show Modal Sheet that Display all the #Rating about specific Fields
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                Translations
                    .of(context)
                    .rating_review,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ArabicFonts.Cairo,
                    color: Colors.white,
                    package: 'google_fonts_arabic',
                    fontSize: EventSizedConstants.TextappBarSize,
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
            ),
            body: new Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SmoothStarRating(
                        rating: 3.2,
                        size: 30,
                        color: Colors.yellow,
                        borderColor: Colors.grey,
                        starCount: 5,
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        Translations
                            .of(context)
                            .total_rating,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: loading
                          ? Center(child: CircularProgressIndicator())
                          : _buildRatingList()),
                ],
              ),
            ),
          );
        });
  }

  //Show builder for #Rating list
  Widget _buildRatingList() {
    Widget _ratingList;
    if (_modelRating.length > 0) {
      _ratingList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 80.0,
        shrinkWrap: true,
        itemCount: _modelRating.length,
        itemBuilder: (BuildContext context, index) {
          final _ratingObj = _modelRating[index];
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: <Widget>[
                        new Container(
                          height: 50.0,
                          width: 50.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/avatar_person.png',
                              image:
                              'http://23.111.185.155:3000/uploads/avtar/${_ratingObj
                                  .logo.filename}',
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 5.0,
                        ),
                        new Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '${_ratingObj.client.first + ' ' +
                                              _ratingObj.client.last}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: ArabicFonts.Cairo,
                                            package: 'google_fonts_arabic',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'عدد التقييمات ${_ratingObj.rate}',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.green,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          '${_ratingObj.comment}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.pinkAccent,
                                            fontFamily: ArabicFonts.Cairo,
                                            package: 'google_fonts_arabic',
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      _ratingList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا توجد تقييمات !',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
    return _ratingList;
  }
}
