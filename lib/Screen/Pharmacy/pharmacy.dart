import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Screen/Pharmacy/pharmacyDetails.dart';
import 'package:tb_alkhalij/model/ModelPharmacy.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class Pharmacy extends StatefulWidget {
  final Widget child;
  Pharmacy({Key key, this.child}) : super(key: key);
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  //---------------------------------------------------------------
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  Icon _searchIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  bool _loading = false;

  void _getPharmacyNames() async {
    final response = await dio.get('http://23.111.185.155:3000/api/pharmacy');
    List<ModelPharmacy> tempList = <ModelPharmacy>[];
    for (int i = 0; i < response.data['pharmacys'].length; i++) {
      var rest = response.data['pharmacys'] as List;
      _modelPharmacy = rest
          .map<ModelPharmacy>((rest) => ModelPharmacy.fromJson(rest))
          .toList();
      tempList.add(ModelPharmacy.fromJson(response.data['pharmacys'][i]));
    }
    setState(() {
      if (response.statusCode == 200) {
        names = tempList;
        names.shuffle();
        _modelPharmacy = names;
      }
    });
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
//    Translations.of(context).insurance,
    'الصيدليات',
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

  _PharmacyState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _modelPharmacy = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//---------------------------------------------------------------
  List<ModelPharmacy> _modelPharmacy = <ModelPharmacy>[];

  Future<List<ModelPharmacy>> getPharmacy() async {
    String link = "http://23.111.185.155:3000/api/pharmacy";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);

        var rest = data['pharmacys'] as List;
        _modelPharmacy = rest
            .map<ModelPharmacy>((rest) => ModelPharmacy.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelPharmacy;
  }

  Future<Null> _refresh() {
    return getPharmacy().then((modelCen) {
      setState(() => _modelPharmacy = modelCen);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getPharmacy();
    this._getPharmacyNames();
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: _loading
                      ? new Center(child: new CircularProgressIndicator())
                      : _buildProductList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget PharmacyList;
    if (_modelPharmacy.length > 0) {
      if (!(_searchText.isEmpty)) {
        List<ModelPharmacy> tempList = <ModelPharmacy>[];
        for (int i = 0; i < _modelPharmacy.length; i++) {
          if (_modelPharmacy[i]
              .name
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_modelPharmacy[i]);
          }
        }
        _modelPharmacy = tempList;
      }
      PharmacyList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelPharmacy.length,
        itemBuilder: (BuildContext context, index) {
          final PharmacyObj = _modelPharmacy[index];
          print("***********PharmacyObj.id**************");
          print(PharmacyObj.id);
          print("***********PharmacyObj.id**************");
          return new GestureDetector(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //This is the list view search result
                child: Container(
                  height: 140.0,
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
                              'http://23.111.185.155:3000/uploads/files/${PharmacyObj
                                  .logo.filename}',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                            const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${PharmacyObj.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize:
                                          EventSizedConstants.TextnameSize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    SmoothStarRating(
                                      rating: 3.2,
                                      size: 15,
                                      color: Colors.yellow,
                                      borderColor: Colors.grey,
                                      starCount: 5,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "${PharmacyObj.description}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: EventSizedConstants
                                              .TextdescriptionSize,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: EventSizedConstants.TextIconSized,
                                      text:
                                      "${PharmacyObj.open.substring(11, 16)}",
                                      icon: Icons.access_time,
                                      isColumn: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${PharmacyObj.center_type}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: EventSizedConstants.TextIconSized,
                                      text:
                                      "${PharmacyObj.close.substring(11, 16)}",
                                      icon: Icons.timer_off,
                                      isColumn: false,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PharmacyDetails(
                        id: PharmacyObj.id,
                        name: PharmacyObj.name,
                        email: PharmacyObj.email,
                        description: PharmacyObj.description,
                        close: PharmacyObj.close,
                        open: PharmacyObj.open,
                        isActive: PharmacyObj.isActive,
                        inviled: PharmacyObj.inviled,
                        country: PharmacyObj.address.country,
                        postcode: PharmacyObj.address.postcode,
                        state: PharmacyObj.address.state,
                        street1: PharmacyObj.address.street1,
                        suburb: PharmacyObj.address.suburb,
                        center_type: PharmacyObj.center_type,
                        logo: PharmacyObj.logo.filename,
                        lang: PharmacyObj.lang,
                        lat: PharmacyObj.lat,
                        committee: PharmacyObj.committee,
                      ),
                ),
              );
            },
          );
        },
      );
    } else {
      PharmacyList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا توجد صيدليات !',
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
    return PharmacyList;
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
            hintText: 'بحث بإسم الصيدلية...',
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
          'الصيدليات',
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
        _modelPharmacy = names;
        _filter.clear();
      }
    });
  }
}
