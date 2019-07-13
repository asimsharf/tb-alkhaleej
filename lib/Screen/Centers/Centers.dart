import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Screen/Centers/CentersDetails.dart';
import 'package:tb_alkhalij/model/ModelCenters.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class Centers extends StatefulWidget {
  final Widget child;
  Centers({Key key, this.child}) : super(key: key);
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  TextEditingController __editingController = TextEditingController();
  final _duplicateItems = List<String>.generate(100, (i) => "إسم المركز $i");
  var _items = List<String>();

  bool _loading = false;

  List<ModelCenters> _modelCenters = <ModelCenters>[];

  Future<List<ModelCenters>> getCenters() async {
    String link = "http://23.111.185.155:3000/api/centers";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        print(res.body);
        print('***************');
        print(data['Centers'][0]['_id']);
        var rest = data['Centers'] as List;
        _modelCenters = rest
            .map<ModelCenters>((rest) => ModelCenters.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelCenters;
  }

  @override
  void initState() {
    super.initState();
    _items.addAll(_duplicateItems);
    this.getCenters();
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldCentersPageKey =
        new GlobalKey<ScaffoldState>();

    return new Scaffold(
      key: _scaffoldCentersPageKey,
      appBar: new AppBar(
        title: Text(
          "المستشفيات",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, left: 0.0, bottom: 5.0),
              child: new TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: __editingController,
                decoration: new InputDecoration(
                    hintText: "بحث بإسم المشفى...",
                    hintStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                    suffixIcon: InkWell(
                      splashColor: Color(0xFF009AFF),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Filter');
                      },
                      child: Icon(
                        FontAwesomeIcons.slidersH,
                        color: Color(0xFF00C2E7),
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      child: Icon(
                        Icons.search,
                        color: Color(0xFF00C2E7),
                      ),
                      onTap: () {},
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
            new Expanded(
                child: _loading
                    ? new Center(child: new CircularProgressIndicator())
                    : _buildProductList()),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/MapsSample');
        },
        child: Icon(
          Icons.location_on,
        ),
        backgroundColor: Color(0xFF00C2E7),
      ),
    );
  }

  Widget _buildProductList() {
    Widget CentersList;
    if (_modelCenters.length > 0) {
      CentersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelCenters.length,
        itemBuilder: (BuildContext context, index) {
          final CentersObj = _modelCenters[index];
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
                                  'http://23.111.185.155:3000/uploads/files/${CentersObj.logo.filename}',
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
                                        '${CentersObj.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.0,
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
                                        "${CentersObj.description}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: 10.0,
                                      text:
                                          "من ${CentersObj.open.substring(0, 9)}",
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
                                        '${CentersObj.center_type}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.pinkAccent,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      size: 10.0,
                                      text:
                                          "الى ${CentersObj.close.substring(0, 9)}",
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
                        id: CentersObj.id,
                        name: CentersObj.name,
                        email: CentersObj.email,
                        description: CentersObj.description,
                        close: CentersObj.close,
                        open: CentersObj.open,
                        isActive: CentersObj.isActive,
                        inviled: CentersObj.inviled,
                        country: CentersObj.address.country,
                        postcode: CentersObj.address.postcode,
                        state: CentersObj.address.state,
                        street1: CentersObj.address.street1,
                        suburb: CentersObj.address.suburb,
                        center_type: CentersObj.center_type,
                        logo: CentersObj.logo.filename,
                        lang: CentersObj.lang,
                        lat: CentersObj.lat,
                      ),
                ),
              );
            },
          );
        },
      );
    } else {
      CentersList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا توجد مستشفيات !',
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
    return CentersList;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(_duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _items.clear();
        _items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _items.clear();
        _items.addAll(_duplicateItems);
      });
    }
  }
}
