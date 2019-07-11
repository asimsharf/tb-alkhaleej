import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

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
                color: Colors.white)),
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            GestureDetector(
              child: makeDashboardItem("المستشفبات", Icons.local_hospital),
              onTap: () {
                Navigator.pushNamed(context, '/Center');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الصيدليات", Icons.local_pharmacy),
              onTap: () {
                Navigator.pushNamed(context, '/Pharmacy');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("العيادات", Icons.local_activity),
              onTap: () {
                Navigator.pushNamed(context, '/Clinic');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("شركات التأمين", Icons.style),
              onTap: () {
                Navigator.pushNamed(context, '/Consulting');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الإستشارات", Icons.call_received),
              onTap: () {
                Navigator.pushNamed(context, '/Consulting');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الأطباء", Icons.local_hospital),
              onTap: () {
                Navigator.pushNamed(context, '/Doctor');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الأخبار", Icons.show_chart),
              onTap: () {
                Navigator.pushNamed(context, '/News');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الحجوزات", Icons.book),
              onTap: () {
                Navigator.pushNamed(context, '/Booking');
              },
            ),
            GestureDetector(
              child: makeDashboardItem("الإعدادات", Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, '/Setting');
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
                      color: Colors.white),
                ),
              ),
              accountEmail: new Text(
                "asim@info.com",
                style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    color: Colors.white),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: new Color(0xFF00C2E7),
                child: new Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      image: new DecorationImage(
                        image: new AssetImage("assets/person.png"),
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
              title: Text(Translations.of(context).home,
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                      fontSize: 20.0)),
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
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/UserProfile');
              },
            ),
            //Offers
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF00C2E7),
                child: Icon(
                  Icons.local_offer,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text("Offers",
                  style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              onTap: () {
                Navigator.popAndPushNamed(context, '/CenterOffers');
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
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
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
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/UserLogin');
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
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
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
                        color: Color(0xFF37505D),
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                        fontSize: 20.0)),
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
        elevation: 20.0,
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
              SizedBox(height: 20.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              )),
              SizedBox(height: 18.0),
              new Center(
                child: new Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              )
            ],
          ),
        ));
  }
}
