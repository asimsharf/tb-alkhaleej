import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Insurance/InsuranceDetails.dart';
import 'package:tb_alkhalij/model/ModelInsurance.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

class Insurance extends StatefulWidget {
  final Widget child;

  Insurance({Key key, this.child}) : super(key: key);

  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
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

  void _getInsuranceNames() async {
    final response = await dio.get('http://23.111.185.155:3000/api/insurances');
    List<ModelInsurance> tempList = <ModelInsurance>[];
    for (int i = 0; i < response.data['committee'].length; i++) {
      var rest = response.data['committee'] as List;
      _modelInsurance = rest
          .map<ModelInsurance>(
            (rest) => ModelInsurance.fromJson(rest),
      )
          .toList();
      tempList.add(
        ModelInsurance.fromJson(
          response.data['committee'][i],
        ),
      );
    }
    setState(
          () {
        if (response.statusCode == 200) {
          names = tempList;
          names.shuffle();
          _modelInsurance = names;
        }
      },
    );
  }

//---------------------------------------------------------------
  List<ModelInsurance> _modelInsurance = <ModelInsurance>[];

  Future<List<ModelInsurance>> getInsurance() async {
    String link = "http://23.111.185.155:3000/api/insurances";
    var res = await http.get(
      Uri.encodeFull(link),
      headers: {"Accept": "application/json"},
    );
    setState(
          () {
        if (res.statusCode == 200) {
          var data = json.decode(res.body);
          var rest = data['committee'] as List;
          _modelInsurance = rest
              .map<ModelInsurance>(
                (rest) => ModelInsurance.fromJson(rest),
          )
              .toList();
          _loading = false;
        }
      },
    );
    return _modelInsurance;
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
    'شركات التأمين',
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
      ],
    ),
  );

  _InsuranceState() {
    _filter.addListener(
          () {
        if (_filter.text.isEmpty) {
          setState(
                () {
              _searchText = "";
              _modelInsurance = names;
            },
          );
        } else {
          setState(
                () {
              _searchText = _filter.text;
            },
          );
        }
      },
    );
  }

  Future<Null> _refresh() {
    return getInsurance().then(
          (modelCen) {
        setState(() => _modelInsurance = modelCen);
      },
    );
  }

//---------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getInsurance();
    this._getInsuranceNames();
    setState(
          () {
        _loading = true;
      },
    );
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
                      ? new Center(
                    child: new CircularProgressIndicator(),
                  )
                      : _buildProductList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget _centersList;
    if (_modelInsurance.length > 0) {
      if (_searchText.isNotEmpty) {
        List<ModelInsurance> tempList = <ModelInsurance>[];
        for (int i = 0; i < _modelInsurance.length; i++) {
          if (_modelInsurance[i]
              .name
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_modelInsurance[i]);
          }
        }
        _modelInsurance = tempList;
      }

      _centersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 70.0,
        shrinkWrap: true,
        itemCount: names == null ? 0 : _modelInsurance.length,
        itemBuilder: (BuildContext context, int index) {
          final _insuranceObj = _modelInsurance[index];

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
                  height: 70.0,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/logo.png',
                              image:
                              'http://23.111.185.155:3000/uploads/insurance/${_insuranceObj
                                  .logo.filename}',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                            const EdgeInsets.only(left: 20.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${_insuranceObj.name}',
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
                                  ],
                                ),
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
                  builder: (context) => InsuranceDetails(
                    id: _insuranceObj.id,
                    name: _insuranceObj.name,
                    logo: _insuranceObj.logo.filename,
                  ),
                ),
              );
            },
          );
        },
      );
    } else {
      _centersList = new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              Translations
                  .of(context)
                  .no_hospital,
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
            hintText: Translations
                .of(context)
                .search_by_insurance_name,
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
              .insurances,
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
        _modelInsurance = names;
        _filter.clear();
      }
    });
  }
}
