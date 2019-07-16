import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tb_alkhalij/Screen/Departmen/Department.dart';
import 'package:tb_alkhalij/ui_widgets/TextIcon.dart';

class ConsultingDetails extends StatefulWidget {
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

  ConsultingDetails({this.id,
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
    this.logo});

  @override
  _ConsultingDetailsState createState() => _ConsultingDetailsState();
}

class _ConsultingDetailsState extends State<ConsultingDetails> {
  final Set<Marker> _markers = Set();
  final double _zoom = 10;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(0, -0));
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _goToMaps() async {
    double lat = double.parse(widget.lat) as double;
    double long = double.parse(widget.lang) as double;
    GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('${widget.id}'),
          position: LatLng(lat, long),
          infoWindow: InfoWindow(
              title: '${widget.name}', snippet: '${widget.description}'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  initState() {
    super.initState();
    setState(() {
      _goToMaps();
      //_getLocation();
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              widget.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.white),
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
                    'http://23.111.185.155:3000/uploads/files/${widget.logo}',
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20.0,
                      ),
                      Expanded(
                        child: Text(
                          '${widget.country}, ${widget.postcode}, ${widget
                              .state}, ${widget.street1}, ${widget.suburb}',
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      new FlatButton(
                        onPressed: () => _ShowRattingAlert(),
                        child: new Text(
                          'تقييم',
                          style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              color: Color(0xFFE91E63),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      TextIcon(
                        text: widget.open.substring(0, 9),
                        icon: Icons.access_time,
                        isColumn: true,
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${widget.center_type}',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                      TextIcon(
                        text: "${1.5} km",
                        icon: Icons.location_on,
                        isColumn: false,
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
                      builder: (context) =>
                          Department(
                            id: widget.id,
                            name: widget.name,
                          ),
                    ),
                  );
                },
                color: Color(0xFF00C2E7),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("الأقسام",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _ShowRattingAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("تقييم",
                          style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                            rating: rating,
                            size: 30,
                            color: Colors.yellow,
                            starCount: 5,
                            onRatingChanged: (value) {
                              setState(() {
                                rating = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "إضافة ملاحظة",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontSize: 15.0,
                          )),
                      maxLines: 8,
                    ),
                  ),
                  new InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF00C2E7),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "إضافة تقيم",
                        style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
