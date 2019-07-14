import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Screen/Pharmacy/pharmacyDetails.dart';
import 'package:tb_alkhalij/model/ModelPharmacy.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class Pharmacy extends StatefulWidget {
  final Widget child;
  Pharmacy({Key key, this.child}) : super(key: key);
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  TextEditingController __editingController = TextEditingController();
  final _duplicateItems = List<String>.generate(100, (i) => "إسم المركز $i");
  var _items = List<String>();

  bool _loading = false;

  List<ModelPharmacy> _modelPharmacy = <ModelPharmacy>[];

  Future<List<ModelPharmacy>> getPharmacy() async {
    String link = "http://23.111.185.155:3000/api/pharmacy";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        print('***********************************');
        print(res.body.toString());
        print('***********************************');
        print('***********************************');
        print(data['pharmacys'][0]['_id']);
        print(data['pharmacys'][0]['email']);
        print(data['pharmacys'][0]['name']);
        print(data['pharmacys'][0]['inviled']);
        print('***********************************');
        var rest = data['pharmacys'] as List;
        _modelPharmacy = rest
            .map<ModelPharmacy>((rest) => ModelPharmacy.fromJson(rest))
            .toList();
        _loading = false;
      }
    });
    return _modelPharmacy;
  }

  @override
  void initState() {
    super.initState();
    _items.addAll(_duplicateItems);
    this.getPharmacy();
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldPharmacyPageKey =
        new GlobalKey<ScaffoldState>();

    return new Scaffold(
      key: _scaffoldPharmacyPageKey,
      appBar: new AppBar(
        title: Text(
          "الصيدليات",
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
                    hintText: "بحث بإسم الصيدلية...",
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
    Widget PharmacyList;
    if (_modelPharmacy.length > 0) {
      PharmacyList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _modelPharmacy.length,
        itemBuilder: (BuildContext context, index) {
          final PharmacyObj = _modelPharmacy[index];
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
                                        "${PharmacyObj.description}",
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
                                      "من ${PharmacyObj.open.substring(0, 9)}",
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
                                      size: 10.0,
                                      text:
                                      "الى ${PharmacyObj.close.substring(
                                          0, 9)}",
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
