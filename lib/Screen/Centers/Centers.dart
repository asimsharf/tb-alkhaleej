import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Centers/CentersDetails.dart';
import 'package:tb_alkhalij/model/ModelCenters.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class Centers extends StatefulWidget {
  final Widget child;
  Centers({Key key, this.child}) : super(key: key);
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
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

  List<ModelCenters> _modelCenters = <ModelCenters>[];
  double total = 0;
  List rates = [];

  Future<List<ModelCenters>> getCenters() async {
//    String _url = ConstantsAPIs.API_BASE_URL;
//    String _headers = ConstantsAPIs.OCTET_STREAM_ENCODING;
//    String _route = Routers.HOSPITAL;

    String link = "http://23.111.185.155:3000/api/hospital";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);

        var rest = data['hospitals'] as List;
        _modelCenters = rest
            .map<ModelCenters>((rest) => ModelCenters.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelCenters;
  }

  void _getCenterNames() async {
    //http://23.111.185.155:3000/api/rating/5d29dbc48f8b1a41f04745bd/center
    final response = await dio.get('http://23.111.185.155:3000/api/hospital');
    List<ModelCenters> tempList = <ModelCenters>[];
    for (int i = 0; i < response.data['hospitals'].length; i++) {
      var rest = response.data['hospitals'] as List;
      _modelCenters = rest
          .map<ModelCenters>((rest) => ModelCenters.fromJson(rest))
          .toList();
      tempList.add(ModelCenters.fromJson(response.data['hospitals'][i]));
    }
    setState(() {
      if (response.statusCode == 200) {
        names = tempList;
        names.shuffle();
        _modelCenters = names;
      }
    });
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
    //Translations.of(context).insurance,
    'المستشفيات',
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
  );

  _CentersState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _modelCenters = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  //---------------------------------------------------------------

  Future<Null> _refresh() {
    return getCenters().then((modelCen) {
      setState(() => _modelCenters = modelCen);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getCenters();
    this._getCenterNames();
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
    Widget _centersList;
    if (_modelCenters.length > 0) {
      if ((_searchText.isNotEmpty)) {
        List<ModelCenters> tempList = <ModelCenters>[];
        for (int i = 0; i < _modelCenters.length; i++) {
          if (_modelCenters[i]
              .name
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_modelCenters[i]);
          }
        }
        _modelCenters = tempList;
      }
      _centersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelCenters.length,
        itemBuilder: (BuildContext context, index) {
          final _centersObj = _modelCenters[index];

          if (_centersObj.centerType == 'hospital') {
            _centersObj.centerType = Translations.of(context).hospital;
          }

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
                                  'http://23.111.185.155:3000/uploads/files/${_centersObj.logo.filename}',
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
                                        '${_centersObj.name}',
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
                                      rating: 4.5,
                                      size: 10,
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
                                        "${_centersObj.description}",
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
                                          "${_centersObj.open.substring(11, 16)}",
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
                                        '${_centersObj.centerType}',
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
                                          "${_centersObj.close.substring(11, 16)}",
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
                  builder: (context) => CentersDetails(
                        id: _centersObj.id,
                        centerId: _centersObj.id,
                        name: _centersObj.name,
                        centerName: _centersObj.name,
                        email: _centersObj.email,
                        description: _centersObj.description,
                        close: _centersObj.close,
                        open: _centersObj.open,
                        isActive: _centersObj.isActive,
                        inviled: _centersObj.inviled,
                        country: _centersObj.address.country,
                        postcode: _centersObj.address.postcode,
                        state: _centersObj.address.state,
                        street1: _centersObj.address.street1,
                        suburb: _centersObj.address.suburb,
                        centerType: _centersObj.centerType,
                        logo: _centersObj.logo.filename,
                        lang: _centersObj.lang,
                        lat: _centersObj.lat,
                        committee: _centersObj.committee,
                        days: _centersObj.days,
                      ),
                ),
              );
            },
          );
        },
      );
    } else {
      _centersList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              Translations.of(context).no_hospital,
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
    return _centersList;
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
            hintText: Translations.of(context).search_by_hospital_name,
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
          Translations.of(context).center,
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
        _modelCenters = names;
        _filter.clear();
      }
    });
  }
}
