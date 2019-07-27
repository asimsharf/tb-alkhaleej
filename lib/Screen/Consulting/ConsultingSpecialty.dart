import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tb_alkhalij/Account/UserLoginRegister/pages/LoginPage.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/utils/app_shared_preferences.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Booking/Book.dart';
import 'package:tb_alkhalij/model/ModelConsultingSpecialty.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class ConsultingSpecialty extends StatefulWidget {
  final String id;
  final String centerId;
  final String centerName;
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

  ConsultingSpecialty({
    this.id,
    this.centerId,
    this.centerName,
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
  _ConsultingSpecialtyState createState() => _ConsultingSpecialtyState();
}

class _ConsultingSpecialtyState extends State<ConsultingSpecialty> {
  //---------------------------------------------------------------
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  Icon _searchIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  bool loading = false;

  void _getCenterNames() async {
    final response = await dio
        .get('http://23.111.185.155:3000/api/center/${widget.id}/Specialty');
    List<ModelConsultingSpecialty> tempList = <ModelConsultingSpecialty>[];
    for (int i = 0; i < response.data['departments'].length; i++) {
      var rest = response.data['departments'] as List;
      _modelConsultingSpecialty = rest
          .map<ModelConsultingSpecialty>(
              (rest) => ModelConsultingSpecialty.fromJson(rest))
          .toList();
      tempList.add(
          ModelConsultingSpecialty.fromJson(response.data['departments'][i]));
    }
    setState(() {
      if (response.statusCode == 200) {
        names = tempList;
        names.shuffle();
        _modelConsultingSpecialty = names;
      }
    });
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
//    Translations.of(context).insurance,
    'التخصصات',
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        fontSize: EventSizedConstants.TextappBarSize,
        color: Colors.white,
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
  );

  _ConsultingSpecialtyState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _modelConsultingSpecialty = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//---------------------------------------------------------------

  List<ModelConsultingSpecialty> _modelConsultingSpecialty =
      <ModelConsultingSpecialty>[];

  Future<List<ModelConsultingSpecialty>> getCenters() async {
    String link =
        "http://23.111.185.155:3000/api/center/${widget.id}/department";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['departments'] as List;
        _modelConsultingSpecialty = rest
            .map<ModelConsultingSpecialty>(
                (rest) => ModelConsultingSpecialty.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _modelConsultingSpecialty;
  }

  @override
  void initState() {
    super.initState();
    this.getCenters();
    this._getCenterNames();
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : _buildProductList()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget _consultingSpecialtyList;
    if (_modelConsultingSpecialty.length > 0) {
      if (_searchText.isNotEmpty) {
        List<ModelConsultingSpecialty> tempList = <ModelConsultingSpecialty>[];
        for (int i = 0; i < _modelConsultingSpecialty.length; i++) {
          if (_modelConsultingSpecialty[i]
              .name
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_modelConsultingSpecialty[i]);
          }
        }
        _modelConsultingSpecialty = tempList;
      }
      _consultingSpecialtyList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelConsultingSpecialty.length,
        itemBuilder: (BuildContext context, index) {
          final _consultingSpecialtyObj = _modelConsultingSpecialty[index];

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
                  height: 150.0,
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
                              placeholder: 'assets/logo.png',
                              image:
                              'http://23.111.185.155:3000/uploads/Specializations/${_consultingSpecialtyObj
                                  .image.filename}',
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
                                        '${_consultingSpecialtyObj.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
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
                                        '${widget.name}',
                                        style: TextStyle(
                                          fontSize: 8.0,
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
                                        '${_consultingSpecialtyObj
                                            .description}',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    new MaterialButton(
                                      onPressed: () async {
                                        bool isLoggedIn =
                                        await AppSharedPreferences
                                            .isUserLoggedIn();
                                        if (this.mounted) {
                                          setState(() {
                                            if (isLoggedIn != null &&
                                                isLoggedIn) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Book(
                                                        id: widget.id,
                                                        centerId:
                                                        widget.centerId,
                                                        departmentId:
                                                        _consultingSpecialtyObj
                                                            .id,
                                                        name:
                                                        _consultingSpecialtyObj
                                                            .name,
                                                        centerName:
                                                        widget.centerName,
                                                        description:
                                                        _consultingSpecialtyObj
                                                            .description,
                                                        logo:
                                                        _consultingSpecialtyObj
                                                            .image.filename,
                                                        close: widget.close,
                                                        open: widget.open,
                                                        country: widget.country,
                                                        postcode:
                                                        widget.postcode,
                                                        state: widget.state,
                                                        street1: widget.street1,
                                                        suburb: widget.suburb,
                                                        centerType:
                                                        widget.centerType,
                                                        lang: widget.lang,
                                                        lat: widget.lat,
                                                        committee:
                                                        widget.committee,
                                                        days: widget.days,
                                                      ),
                                                ),
                                              );
                                            } else {
                                              Navigator.pushReplacement(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                    new LoginPage()),
                                              );
                                            }
                                          });
                                        }
                                      },
                                      color: Color(0xFFE91E63),
                                      splashColor: Color(0xFFFF1B5E),
                                      textColor: Colors.white,
                                      elevation: 0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: new Text(
                                            Translations
                                                .of(context)
                                                .book,
                                            style: TextStyle(
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontSize: 12.0,
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
      _consultingSpecialtyList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              Translations
                  .of(context)
                  .no_specialty,
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
    return _consultingSpecialtyList;
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          autofocus: true,
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: Translations
                .of(context)
                .search_by_specialty_name,
            hintStyle: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.white),
          ),
        );
      } else {
        this._searchIcon = new Icon(
          Icons.search,
          color: Colors.white,
        );
        this._appBarTitle = new Text(
          Translations
              .of(context)
              .specialty,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: ArabicFonts.Cairo,
              color: Colors.white,
              fontSize: EventSizedConstants.TextappBarSize,
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
        );
        _modelConsultingSpecialty = names;
        _filter.clear();
      }
    });
  }
}
