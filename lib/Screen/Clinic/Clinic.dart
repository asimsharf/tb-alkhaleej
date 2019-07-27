import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Clinic/ClinicDetails.dart';
import 'package:tb_alkhalij/model/ModelClinic.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class Clinic extends StatefulWidget {
  final Widget child;
  Clinic({Key key, this.child}) : super(key: key);

  _ClinicState createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
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

  void _getClinicNames() async {
    final response = await dio.get('http://23.111.185.155:3000/api/clinic');
    List<ModelClinic> tempList = <ModelClinic>[];
    for (int i = 0; i < response.data['clinic'].length; i++) {
      var rest = response.data['clinic'] as List;
      _modelClinic =
          rest.map<ModelClinic>((rest) => ModelClinic.fromJson(rest)).toList();
      tempList.add(ModelClinic.fromJson(response.data['clinic'][i]));
    }
    setState(() {
      if (response.statusCode == 200) {
        names = tempList;
        names.shuffle();
        _modelClinic = names;
      }
    });
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
//    Translations.of(context).insurance,
    'العيادات',
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

  _ClinicState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          _modelClinic = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//---------------------------------------------------------------

  List<ModelClinic> _modelClinic = <ModelClinic>[];

  Future<List<ModelClinic>> getCenters() async {
    String link = "http://23.111.185.155:3000/api/clinic";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['clinic'] as List;
        _modelClinic = rest
            .map<ModelClinic>((rest) => ModelClinic.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelClinic;
  }

  Future<Null> _refresh() {
    return getCenters().then((modelCen) {
      setState(() => _modelClinic = modelCen);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getCenters();
    this._getClinicNames();
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
    if (_modelClinic.length > 0) {
      if ((_searchText.isNotEmpty)) {
        List<ModelClinic> tempList = <ModelClinic>[];
        for (int i = 0; i < _modelClinic.length; i++) {
          if (_modelClinic[i]
              .name
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_modelClinic[i]);
          }
        }
        _modelClinic = tempList;
      }
      _centersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelClinic.length,
        itemBuilder: (BuildContext context, index) {
          final _clinicObj = _modelClinic[index];
          if (_clinicObj.centerType == 'clinic') {
            _clinicObj.centerType = Translations
                .of(context)
                .clinic;
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
                              'http://23.111.185.155:3000/uploads/files/${_clinicObj
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
                                        '${_clinicObj.name}',
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
                                        "${_clinicObj.description}",
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
                                      "${_clinicObj.open.substring(11, 16)}",
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
                                        '${_clinicObj.centerType}',
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
                                      "${_clinicObj.close.substring(11, 16)}",
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
                  builder: (context) => ClinicDetails(
                    id: _clinicObj.id,
                    centerId: _clinicObj.id,
                    name: _clinicObj.name,
                    centerName: _clinicObj.name,
                    email: _clinicObj.email,
                    description: _clinicObj.description,
                    close: _clinicObj.close,
                    open: _clinicObj.open,
                    isActive: _clinicObj.isActive,
                    inviled: _clinicObj.inviled,
                    country: _clinicObj.address.country,
                    postcode: _clinicObj.address.postcode,
                    state: _clinicObj.address.state,
                    street1: _clinicObj.address.street1,
                    suburb: _clinicObj.address.suburb,
                    centerType: _clinicObj.centerType,
                    logo: _clinicObj.logo.filename,
                    lang: _clinicObj.lang,
                    lat: _clinicObj.lat,
                    committee: _clinicObj.committee,
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
              'عفواً لا توجد عيادات !',
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
            hintText: 'بحث بإسم العياده...',
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
          'العيادات',
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
        _modelClinic = names;
        _filter.clear();
      }
    });
  }
}
