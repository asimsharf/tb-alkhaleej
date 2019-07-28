import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/MainPage.dart';

import '../customviews/progress_dialog.dart';
import '../futures/app_futures.dart';
import '../pages/register_page.dart';
import '../utils/app_shared_preferences.dart';
import '../utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final globalKey = new GlobalKey<ScaffoldState>();

  ProgressDialog progressDialog =
      ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController =
      new TextEditingController(text: "");

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[_loginContainer(), progressDialog],
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
        padding: const EdgeInsets.only(top: 120.0),
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  _appIcon(),
//------------------------------------------------------------------------------
                  _formContainer(),
//------------------------------------------------------------------------------
                ],
              ),
            ),
          ],
        ));
  }

//------------------------------------------------------------------------------

  Widget _appIcon() {
    return new Container(
      child: new Image(
        image: new AssetImage("assets/logo.png"),
        height: 170.0,
        width: 170.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
        child: new Theme(
          data: new ThemeData(primarySwatch: Colors.lightBlue),
          child: Container(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: new Column(
              children: <Widget>[
//------------------------------------------------------------------------------
                _emailContainer(),
//------------------------------------------------------------------------------
                _passwordContainer(),
//------------------------------------------------------------------------------
                _loginButtonContainer(),
//------------------------------------------------------------------------------
                _registerNowLabel(),
//------------------------------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
      child: new TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail_outline),
          labelText: Translations
              .of(context)
              .username,
          fillColor: Color(0xFF37505D),
          labelStyle: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
      child: new TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: Translations
              .of(context)
              .password,
          fillColor: Color(0xFF37505D),
          labelStyle: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      margin: EdgeInsets.only(bottom: 35.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _loginButtonContainer() {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(color: Colors.white),
      child: new MaterialButton(
        height: 40.0,
        minWidth: 100.0,
        color: Color(0xFF13A1C5),
        splashColor: Color(0xFF009AFF),
        textColor: Colors.white,
        padding: EdgeInsets.all(15.0),
        onPressed: _loginButtonAction,
        child: new Icon(FontAwesomeIcons.signInAlt),
      ),
      margin: EdgeInsets.only(bottom: 30.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _registerNowLabel() {
    return new GestureDetector(
      onTap: _goToRegisterScreen,
      child: new Container(
        child: new Text(
          Translations
              .of(context)
              .new_user,
          style: TextStyle(
            color: Color(0xFF37505D),
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0),
      ),
    );
  }

//------------------------------------------------------------------------------
  Future _loginButtonAction() async {
    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(
            Translations
                .of(context)
                .ENTER_EMAIL,
            style: TextStyle(
              color: Colors.white,
              fontFamily: ArabicFonts.Cairo,
              fontWeight: FontWeight.bold,
              package: 'google_fonts_arabic',
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(
            Translations
                .of(context)
                .ENTER_PASS,
            style: TextStyle(
              color: Colors.white,
              fontFamily: ArabicFonts.Cairo,
              fontWeight: FontWeight.bold,
              package: 'google_fonts_arabic',
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    FocusScope.of(context).requestFocus(
      new FocusNode(),
    );
    progressDialog.showProgress();
    _loginUser(emailController.text, passwordController.text, context);
  }

//------------------------------------------------------------------------------
  void _loginUser(String id, String password, BuildContext context) async {
    var eventObject = await loginUser(id, password);
    Map<String, dynamic> user = eventObject.object;

    switch (eventObject.id) {
      case 1:
        {
          setState(
                () {
              AppSharedPreferences.setUserLoggedIn(true);
              AppSharedPreferences.setInSession(
                'userName',
                user['profile']['name']['first'].toString(),
              );
              AppSharedPreferences.setInSession(
                'firstName',
                user['profile']['name']['first'].toString(),
              );
              AppSharedPreferences.setInSession(
                'lastName',
                user['profile']['name']['last'].toString(),
              );
              AppSharedPreferences.setInSession(
                'userGender',
                user['profile']['gender'].toString(),
              );
              AppSharedPreferences.setInSession(
                'userPhone',
                user['profile']['phone'].toString(),
              );
              AppSharedPreferences.setInSession(
                'userBirth',
                user['profile']['birth_day'].toString(),
              );
              AppSharedPreferences.setInSession(
                'userEmail',
                user['profile']['email'].toString(),
              );
//              try {
//                if (user['profile']['avatar']['filename'] != '' ||
//                    user['profile']['avatar']['filename'] != null) {
//                  AppSharedPreferences.setInSession(
//                    'userAvatar',
//                    user['profile']['avatar']['filename'].toString(),
//                  );
//                }
//              } catch (e) {
//                return;
//              }
              AppSharedPreferences.setInSession(
                'userId',
                user['profile']['_id'].toString(),
              );

              globalKey.currentState.showSnackBar(
                new SnackBar(
                  content: new Text(
                    eventObject.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      fontWeight: FontWeight.bold,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  backgroundColor: Colors.green,
                ),
              );
              progressDialog.hideProgress();
              _goToHomeScreen();
            },
          );
        }
        break;
      case 2:
        {
          setState(
                () {
              globalKey.currentState.showSnackBar(
                new SnackBar(
                  content: new Text(
                    eventObject.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
              progressDialog.hideProgress();
            },
          );
        }
        break;

      case 0:
        {
          setState(
                () {
              globalKey.currentState.showSnackBar(
                new SnackBar(
                  content: new Text(
                    eventObject.message,
                    style: TextStyle(
                      color: Color(0xFF37505D),
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  backgroundColor: Colors.orange,
                ),
              );
              progressDialog.hideProgress();
            },
          );
        }
        break;
    }
  }

//------------------------------------------------------------------------------
  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => new MainPage(),
      ),
    );
  }

//------------------------------------------------------------------------------
  void _goToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => new RegisterPage(),
      ),
    );
  }
//------------------------------------------------------------------------------
}
