import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tb_alkhalij/Account/UserLoginRegister/utils/app_shared_preferences.dart';
import 'package:tb_alkhalij/model/ModelBookingHistory.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class BookingHistory extends StatefulWidget {
  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
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
    setState(() {
      userId = userI;
    });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  bool loading = false;
  List<ModelBookingHistory> _modelBookingHistory = <ModelBookingHistory>[];

  Future<List<ModelBookingHistory>> getCenters() async {
    String link =
        "http://23.111.185.155:3000/api/booking/" + userId + "/client";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['departments'] as List;
        _modelBookingHistory = rest
            .map<ModelBookingHistory>(
                (rest) => ModelBookingHistory.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _modelBookingHistory;
  }

  Future<Null> _refresh() {
    return getCenters().then((modelCen) {
      setState(() => _modelBookingHistory = modelCen);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getCenters();
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'حجوزاتي',
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
        centerTitle: true,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: loading
                      ? Center(child: CircularProgressIndicator())
                      : _buildProductList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget _departmentList;
    if (_modelBookingHistory.length > 0) {
      _departmentList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelBookingHistory.length,
        itemBuilder: (BuildContext context, index) {
          final _bookingHistoryObj = _modelBookingHistory[index];
          return new GestureDetector(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //This is the list view search result
                child: Container(
                  height: 114.0,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 90.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/avatar_person.png',
                              image:
                              'http://23.111.185.155:3000/uploads/avtar/${_bookingHistoryObj
                                  .logo.filename}',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${_bookingHistoryObj.patient.first +
                                            ' ' +
                                            _bookingHistoryObj.patient.last}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${_bookingHistoryObj.department}',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.green,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${_bookingHistoryObj.hospital}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${_bookingHistoryObj.date.substring(
                                            11, 16)}  :   ${_bookingHistoryObj
                                            .date.substring(0, 10)}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${_bookingHistoryObj.committee}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    new MaterialButton(
                                      height: 9.0,
                                      onPressed: () {},
                                      color: Color(0xFFE91E63),
                                      splashColor: Color(0xFFFF1B5E),
                                      textColor: Colors.white,
                                      elevation: 0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: new Text("إلغاء الحجز",
                                            style: TextStyle(
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontSize: 9.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          );
        },
      );
    } else {
      _departmentList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لم تقم بعمليه حجز حتى الأن!',
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
    return _departmentList;
  }
}
