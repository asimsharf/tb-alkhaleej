import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/model/ModelInsurance.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class Book extends StatefulWidget {
  final String id;
  final String name;
  final String email;
  final String description;
  final String close;
  final String open;
  final String lat;
  final String lang;
  final bool isActive;
  final bool inviled;
  final String center_type;
  final String country;
  final String postcode;
  final String state;
  final String street1;
  final String suburb;
  final String logo;
  final List committee;

  Book(
      {this.id,
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
      this.center_type,
      this.logo,
      this.committee});

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
//  List getCommitteeList(List str) {
//    List<String> ListOfItems = [];
//    for (var i = 0; i < str.length; i++) {
//      ListOfItems.add(str[i]['name'].toString());
//    }
//    return ListOfItems;
//  }
//  String date = '20180626170555';
//  String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
//  DateTime dateTime = DateTime.parse(dateWithT);

  void convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate).toLocal();
    print(todayDate);
  }

  List<DateTime> availableDaes = [
    DateTime(2019, 7, 1),
    DateTime(2019, 7, 3),
    DateTime(2019, 7, 4),
    DateTime(2019, 7, 5),
    DateTime(2019, 7, 6),
    DateTime(2019, 7, 9),
    DateTime(2019, 7, 10),
    DateTime(2019, 7, 11),
    DateTime(2019, 7, 15),
    DateTime(2019, 7, 11),
    DateTime(2019, 7, 15),
  ];
  List<DateTime> notAvailableDaes = [
    DateTime(2019, 7, 2),
    DateTime(2019, 7, 7),
    DateTime(2019, 7, 8),
    DateTime(2019, 7, 12),
    DateTime(2019, 7, 13),
    DateTime(2019, 7, 14),
    DateTime(2019, 7, 16),
    DateTime(2019, 7, 17),
    DateTime(2019, 7, 18),
    DateTime(2019, 7, 17),
    DateTime(2019, 7, 18),
  ];

  //########################################################################
  DateTime _currentDate2 = DateTime.now();

  static Widget _availableIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  static Widget _notAvailableIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  var len = 9;
  double cHeight;

  //########################################################################
  String _myInsuranceSelection;
  List<ModelInsurance> _modelConsulting = <ModelInsurance>[];

  Future<List<ModelInsurance>> getConsulting() async {
    String link =
        "http://23.111.185.155:3000/api/insurances/5d29a6f424b9f52e481e24d9/center";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);

        var rest = data['Insurances'] as List;
        _modelConsulting = rest
            .map<ModelInsurance>((rest) => ModelInsurance.fromJson(rest))
            .toList();
      }
    });
    return _modelConsulting;
  }

  var rating = 1.2;

  @override
  void initState() {
    super.initState();
    this.getConsulting();
  }

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        availableDaes[i],
        new Event(
          date: availableDaes[i],
          title: 'Event 5',
          icon: _availableIcon(
            availableDaes[i].day.toString(),
          ),
        ),
      );

      for (int i = 0; i < len; i++) {
        _markedDateMap.add(
          notAvailableDaes[i],
          new Event(
            date: notAvailableDaes[i],
            title: 'Event 5',
            icon: _notAvailableIcon(
              notAvailableDaes[i].day.toString(),
            ),
          ),
        );
      }
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.48,
      weekendTextStyle: TextStyle(
        color: Colors.grey,
      ),
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,
      // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

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
                          isEmpty: _modelConsulting == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              isDense: true,
                              isExpanded: true,
                              items: _modelConsulting.map((item) {
                                return new DropdownMenuItem(
                                  child: new Text(
                                    item.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  value: item.id.toString(),
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _calendarCarouselNoHeader,
                      markerRepresent(Colors.grey, "غير متوفر الان"),
                      markerRepresent(Colors.green, "متوفر الان"),
                    ],
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
                onPressed: () {},
                color: Color(0xFF00C2E7),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("حجز",
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

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
        style: TextStyle(
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
          fontSize: EventSizedConstants.TextButtonFontSized,
        ),
      ),
    );
  }
}
