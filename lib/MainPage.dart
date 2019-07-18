import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

//  @override
//  void initState() {
//    super.initState();
//    setState(() {
//      int count;
//      if (MediaQuery.of(context).orientation == Orientation.landscape)
//        count = 4;
//      else
//        count = 2;
//    });
//  }
//
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(Translations.of(context).title,
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
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
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
        child: GridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          primary: false,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .center, Icons.local_hospital),
              onTap: () {
                Navigator.pushNamed(context, '/Center');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .pharmacy, Icons.local_pharmacy),
              onTap: () {
                Navigator.pushNamed(context, '/Pharmacy');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .clinic, Icons.local_activity),
              onTap: () {
                Navigator.pushNamed(context, '/Clinic');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .insurance, Icons.style),
              onTap: () {
                Navigator.pushNamed(context, '/Insurance');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .consulting, Icons.call_received),
              onTap: () {
                Navigator.pushNamed(context, '/Consulting');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations
                      .of(context)
                      .booking, Icons.book),
              onTap: () {
                Navigator.pushNamed(context, '/BookingHistory');
              },
            ),
          ],
        ),
      ),
      drawer: new Drawer(
          child: new Container(
        alignment: Alignment.topCenter,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  Translations.of(context).title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: ArabicFonts.Cairo,
                      fontSize: 18.0,
                      package: 'google_fonts_arabic',
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
                      ]),
                ),
              ),
              accountEmail: new Text(
                "asim@info.com",
                style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
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
                    ]),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: new Color(0xFF00C2E7),
                child: new Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      image: new DecorationImage(
                        image: new AssetImage("assets/avatar_person.png"),
                        fit: BoxFit.cover,
                      ),
                      color: Color(0xFFFFF6E8)),
                ),
              ),
            ),
            //Home
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF00C2E7),
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text(
                Translations
                    .of(context)
                    .home,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: ArabicFonts.Cairo,
                  fontWeight: FontWeight.bold,
                  package: 'google_fonts_arabic',
                  fontSize: 20.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            //Profile
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF00C2E7),
                child: Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text(Translations.of(context).profile,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: ArabicFonts.Cairo,
                    fontWeight: FontWeight.bold,
                    package: 'google_fonts_arabic',
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Colors.black38,
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.popAndPushNamed(context, '/UserProfile');
              },
            ),

            //Language
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF00C2E7),
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text(Translations.of(context).lang,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: ArabicFonts.Cairo,
                    fontWeight: FontWeight.bold,
                    package: 'google_fonts_arabic',
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        color: Colors.black38,
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.popAndPushNamed(context, '/Language');
              },
            ),
            new Divider(
              color: Color(0xFF00C2E7),
            ),
            //Login
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFF00C2E7),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                title: Text(Translations.of(context).login,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8.0,
                          color: Colors.black38,
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/SplashPageLoginTow');
                }),
            //Help
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFF00C2E7),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                title: Text(Translations.of(context).support,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8.0,
                          color: Colors.black38,
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.of(context).pushNamed('/Help');
                }),
            //About
            new ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Color(0xFF00C2E7),
                  child: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                title: Text(Translations.of(context).about,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8.0,
                          color: Colors.black38,
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.of(context).pushNamed('/About');
                }),
          ],
        ),
      )),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        color: Color(0xFF00C4C2),
        elevation: 3.0,
        margin: new EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xFF00C2E7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 15.0),
              Center(
                  child: Icon(
                icon,
                    size: 105.0,
                color: Colors.white,
              )),
              SizedBox(height: 15.0),
              new Center(
                child: new Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
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
              )
            ],
          ),
        ));
  }
}
