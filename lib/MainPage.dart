import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/utils/app_shared_preferences.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/ui_widgets/SizeConfig.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  MainPage({Key key, this.child}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  var userName;
  var userEamil;
  var avatar;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (userName == null || userEamil == null) {
      await initUserProfile();
    }
  }

  Future<void> initUserProfile() async {
    String name = await AppSharedPreferences.getFromSession('userName');
    String email = await AppSharedPreferences.getFromSession('userEmail');
    String avatarpic = await AppSharedPreferences.getFromSession('userAvatar');
    setState(() {
      userName = name;
      userEamil = email;
      avatar = avatarpic;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      key: globalKey,
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
                  Translations.of(context).center, Icons.local_hospital),
              onTap: () {
                Navigator.pushNamed(context, '/Center');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations.of(context).pharmacy, Icons.local_pharmacy),
              onTap: () {
                Navigator.pushNamed(context, '/Pharmacy');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations.of(context).clinic, Icons.local_activity),
              onTap: () {
                Navigator.pushNamed(context, '/Clinic');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations.of(context).insurance, Icons.style),
              onTap: () {
                Navigator.pushNamed(context, '/Insurance');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations.of(context).consulting, Icons.call_received),
              onTap: () {
                Navigator.pushNamed(context, '/Consulting');
              },
            ),
            new GestureDetector(
              child: makeDashboardItem(
                  Translations.of(context).booking, Icons.book),
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
                  child: new Text(
                    ((userName == null) ? "User Name" : userName),
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
                  ((userEamil == null) ? "User Email" : userEamil),
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
                  backgroundColor: new Color(0xFF13A1C5),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: 'assets/logo.png',
                    image: 'assets/avatar_person.png',
                  ),
                ),
              ),
              //Home
              new ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF13A1C5),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                title: Text(
                  Translations.of(context).home,
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
                  backgroundColor: Color(0xFF13A1C5),
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
                  backgroundColor: Color(0xFF13A1C5),
                  child: Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                title: Text('LogOut !!!',
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
                  AppSharedPreferences.clear();
                  Navigator.popAndPushNamed(context, '/MainPage');
                },
              ),
              new Divider(
                color: Color(0xFF13A1C5),
              ),
              //Login
              new ListTile(
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xFF13A1C5),
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
              //Login
              new ListTile(
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xFF13A1C5),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: Text('Log Out !',
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
                    AppSharedPreferences.clear();
                    Navigator.popAndPushNamed(context, '/SearchScreen');
                  }),
              //Help
              new ListTile(
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xFF13A1C5),
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
                    backgroundColor: Color(0xFF13A1C5),
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
        ),
      ),
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
            color: Color(0xFF13A1C5),
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
                      fontSize: 15.0,
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
