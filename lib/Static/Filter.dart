import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String dropdownValue1 = '';
  String dropdownValue2 = '';
  String dropdownValue3 = '';
  String dropdownValue4 = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("فلترة على حسب",
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("نوع الخدمة",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D),
                          fontSize: 18.0)),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue1,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                      });
                    },
                    items: <String>['', 'جراحة', 'تقويم', 'باطنية']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF37505D),
                                fontSize: 18.0)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("الخصومات",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D),
                          fontSize: 18.0)),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue2,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
                    },
                    items: <String>['', '10%', '30%', '50%']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF37505D),
                                fontSize: 18.0)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("التقيم",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D),
                          fontSize: 18.0)),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue3,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue3 = newValue;
                      });
                    },
                    items: <String>['', '4', '3.4', '5']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF37505D),
                                fontSize: 18.0)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("الخدمة المقدمة",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF37505D),
                          fontSize: 18.0)),
                  SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue4,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue4 = newValue;
                      });
                    },
                    items: <String>['', 'اخر', 'باطنية', 'أسنان']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF37505D),
                                fontSize: 18.0)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              new MaterialButton(
                height: 40.0,
                minWidth: 150.0,
                color: Color(0xFF00C2E7),
                splashColor: Color(0xFF009AFF),
                textColor: Colors.white,
                child: new Text("بحث",
                    style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
