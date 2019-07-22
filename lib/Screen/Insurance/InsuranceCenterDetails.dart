import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/Screen/Centers/CentersDepartment.dart';
import 'package:tb_alkhalij/Static/Rating.dart';
import 'package:tb_alkhalij/model/ModelInsurancesCenters.dart';
import 'package:tb_alkhalij/model/ModelRating.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class InsuranceCenterDetails extends StatefulWidget {
  final String id;
  final String center_id;
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

  InsuranceCenterDetails(
      {this.id,
      this.center_id,
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
  _InsuranceCenterDetailsState createState() => _InsuranceCenterDetailsState();
}

class _InsuranceCenterDetailsState extends State<InsuranceCenterDetails> {
  final Set<Marker> _markers = Set();
  final double _zoom = 10;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(0, -0));
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  List<ModelInsurancesCenters> _modelInsurancesCenters =
      <ModelInsurancesCenters>[];

  Future<List<ModelInsurancesCenters>> getInsuranceCenter() async {
    String link =
        "http://23.111.185.155:3000/api/insurances/${widget.id}/centers/${widget.center_id}";
    print('###############LINKE#################');
    print(link.toString());
    print('################LINKE################');
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print('##############res##################');
    print(res.body.toString());
    print('###############res#################');
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);

        var rest = data['Centers'] as List;
        print('###############id#################');
        print(data['Centers'][0]['_id'].toString());
        print('###############id#################');
        _modelInsurancesCenters = rest
            .map<ModelInsurancesCenters>(
                (rest) => ModelInsurancesCenters.fromJson(rest))
            .toList();
        print(_modelInsurancesCenters[0].name);
        print(_modelInsurancesCenters[0].lang);
        print(_modelInsurancesCenters[0].lat);
        print(_modelInsurancesCenters[0].id);
        print('###############id#################');
      }
    });
    return _modelInsurancesCenters;
  }

  List getCenterList(List str) {
    List<String> ListOfItems = [];
    for (var i = 0; i < str.length; i++) {
      ListOfItems.add(str[i]['_d'].toString());
    }
    return ListOfItems;
  }

  Future<void> _goToMaps() async {
    double lat = double.parse(_modelInsurancesCenters[0].lat) as double;
    double long = double.parse(_modelInsurancesCenters[0].lang) as double;
    print("**************lat***************");
    print(lat.toString());
    //print(getCenterList(_modelInsurancesCenters[0].lat));
    print(long.toString());
    print("**************long***************");
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('${_modelInsurancesCenters[0].id}'),
          position: LatLng(lat, long),
          infoWindow: InfoWindow(
              title: '${_modelInsurancesCenters[0].name}',
              snippet: '${_modelInsurancesCenters[0].description}'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  //Future Rating for catch all the rating apis to display
  bool loading = false;
  List<ModelRating> _model_Rating = <ModelRating>[];

  Future<List<ModelRating>> getRatings() async {
    String link =
        "http://23.111.185.155:3000/api/rating/${_modelInsurancesCenters[0].id.toString()}/center";
    print(link.toString());
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body.toString());
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data['Rating'] as List;
        _model_Rating = rest
            .map<ModelRating>((rest) => ModelRating.fromJson(rest))
            .toList();
        loading = false;
      }
    });
    return _model_Rating;
  }

  @override
  initState() {
    super.initState();
    setState(() {
      this.getRatings();
      getInsuranceCenter();
      _goToMaps();
      setState(() {
        loading = true;
      });
    });
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  var rating = 1.2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text(
              '${widget.name}',
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
                        'http://23.111.185.155:3000/uploads/files/${_modelInsurancesCenters[0].logo.filename}',
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
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text(
                          _modelInsurancesCenters[0].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      new FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Rating(
                                    id: _modelInsurancesCenters[0].id,
                                    name: _modelInsurancesCenters[0].name,
                                    logo: _modelInsurancesCenters[0]
                                        .logo
                                        .filename,
                                  ),
                            ),
                          );
                        },
                        child: new Text(
                          Translations.of(context).rate,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              color: Color(0xFFE91E63),
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                //address
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          Translations.of(context).address,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            fontSize: EventSizedConstants.TextTitleFontSized,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 12.0,
                      ),
                      Expanded(
                        child: Text(
                          '${_modelInsurancesCenters[0].address.country}, ${_modelInsurancesCenters[0].address.postcode}, ${_modelInsurancesCenters[0].address.state}, ${_modelInsurancesCenters[0].address.street1}, ${_modelInsurancesCenters[0].address.suburb}',
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            fontSize: 10.0,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //descriptions
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          Translations.of(context).description,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            fontSize: EventSizedConstants.TextTitleFontSized,
                          ),
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
                          _modelInsurancesCenters[0].description,
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontSize: 10.0),
                        ),
                      ),
                      TextIcon(
                        text:
                            _modelInsurancesCenters[0].close.substring(11, 16),
                        icon: Icons.timer_off,
                        isColumn: true,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      TextIcon(
                        text: _modelInsurancesCenters[0].open.substring(11, 16),
                        icon: Icons.access_time,
                        isColumn: true,
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
                          '${_modelInsurancesCenters[0].center_type}',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                new Align(
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      spacing: 3.0,
                      runSpacing: 5.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children:
                          getCommitteeList(_modelInsurancesCenters[0].committee)
                              .map((name) => MyButton(
                                    name,
                                  ))
                              .toList(),
                    )),
                new SizedBox(
                  width: 5.0,
                ),
                //map
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          Translations.of(context).locations,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            fontSize: EventSizedConstants.TextTitleFontSized,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  height: 400.0,
                  child: new Stack(
                    children: <Widget>[
                      new GoogleMap(
                        markers: _markers,
                        mapType: _defaultMapType,
                        myLocationEnabled: true,
                        initialCameraPosition: _initialPosition,
                        onMapCreated: _onMapCreated,
                        zoomGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        compassEnabled: true,
                        tiltGesturesEnabled: true,
                        rotateGesturesEnabled: true,
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 80, right: 10),
                        alignment: Alignment.topRight,
                        child: Column(
                          children: <Widget>[
                            FloatingActionButton(
                                child: Icon(Icons.layers),
                                elevation: 5,
                                backgroundColor: Colors.teal[200],
                                onPressed: () {
                                  _changeMapType();
                                  print('Changing the Map Type');
                                }),
                          ],
                        ),
                      ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CentersDepartment(
                            id: _modelInsurancesCenters[0].id,
                            name: _modelInsurancesCenters[0].name,
                          ),
                    ),
                  );
                },
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(Translations.of(context).department,
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
            new SizedBox(
              width: 2.0,
            ),
            new Expanded(
              child: new MaterialButton(
                onPressed: _showModalSheet,
                color: Color(0xFF13A1C5),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(Translations.of(context).ratings,
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

  List getCommitteeList(List str) {
    List<dynamic> ListOfItems = [];
    for (var i = 0; i < str.length; i++) {
      ListOfItems.add(str[i]['name'].toString());
    }
    return ListOfItems;
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
                Translations.of(context).rating_review,
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
                        Translations.of(context).total_rating,
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
    Widget RatingList;
    if (_model_Rating.length > 0) {
      RatingList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 80.0,
        shrinkWrap: true,
        itemCount: _model_Rating.length,
        itemBuilder: (BuildContext context, index) {
          final RatingObj = _model_Rating[index];
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
                                  'http://23.111.185.155:3000/uploads/avtar/${RatingObj.logo.filename}',
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
                                          '${RatingObj.client.first + ' ' + RatingObj.client.last}',
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
                                        'عدد التقييمات ${RatingObj.rate}',
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
                                          '${RatingObj.comment}',
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
      RatingList = Center(
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
    return RatingList;
  }
}

class MyButton extends StatelessWidget {
  final text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0.0),
        child: OutlineButton(
          padding: EdgeInsets.all(0.0),
          borderSide:
              BorderSide(color: Color(0xFF13A1C5), style: BorderStyle.solid),
          disabledBorderColor: Colors.grey,
          highlightedBorderColor: Color(0xFF009AFF),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontSize: 8.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}