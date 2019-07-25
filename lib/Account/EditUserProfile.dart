//EditUserProfile

import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:intl/intl.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/customviews/progress_dialog.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/futures/app_futures.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/pages/LoginPage.dart';
import 'package:tb_alkhalij/Account/UserLoginRegister/utils/constants.dart';
import 'package:tb_alkhalij/Language/translation_strings.dart';
import 'package:tb_alkhalij/ui_widgets/SizedText.dart';

import 'UserLoginRegister/models/base/EventObject.dart';

class EditUserProfile extends StatefulWidget {
  @override
  createState() => new EditUserProfileState();
}

class EditUserProfileState extends State<EditUserProfile> {
  final globalKey = new GlobalKey<ScaffoldState>();

  //show date time pick up
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);
    var result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    if (result == null) return;
    setState(() {
      dateTimeController.text = new DateFormat.yMd().format(result);
    });
  }

  List<String> _genders = <String>['', 'ذكر', 'انثى'];

  @override
  void initState() {
    super.initState();
  }

  String _gender = '';

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_REGISTER);

  TextEditingController firstNameController =
  new TextEditingController(text: "");
  TextEditingController dateTimeController =
  new TextEditingController(text: "");
  TextEditingController lastNameController =
  new TextEditingController(text: "");
  TextEditingController emailController = new TextEditingController(text: "");
  TextEditingController phoneController = new TextEditingController(text: "");
  TextEditingController passwordController =
  new TextEditingController(text: "");
  TextEditingController genderController = new TextEditingController(text: "");

//------------------------------------------------------------------------------

  bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
        ));
  }

//------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
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
      padding: const EdgeInsets.only(top: 30.0),
      child: new Text(
        Translations
            .of(context)
            .edite_profile_user,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            fontSize: 25.0,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            color: Color(0xFF23AFB1)),
      ),
      margin: EdgeInsets.only(top: 50.0),
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
                    _firstNameContainer(),
//------------------------------------------------------------------------------
                    _lastNameContainer(),

                    _dateOfBarth(),

                    _selectedGender(),

                    _phoneContainer(),
//------------------------------------------------------------------------------
                    _emailContainer(),
//------------------------------------------------------------------------------
                    _passwordContainer(),
//------------------------------------------------------------------------------
                    _registerButtonContainer(),
                  ],
                ),
              ))),
      margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _firstNameContainer() {
    return new Container(
      height: 40.0,
      child: new TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: Translations
                .of(context)
                .firstName,
            labelStyle: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold,
            ),
          ),
          keyboardType: TextInputType.text),
      margin: EdgeInsets.only(bottom: 5.0),
    );
  }

  Widget _lastNameContainer() {
    return new Container(
        height: 40.0,
        child: new TextFormField(
            controller: lastNameController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: Translations
                    .of(context)
                    .lastName,
                labelStyle: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontWeight: FontWeight.bold,
                )),
            keyboardType: TextInputType.text),
        margin: EdgeInsets.only(bottom: 5.0));
  }

  Widget _selectedGender() {
    return Container(
      height: 40.0,
      child: new FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
              prefixIcon: const Icon(Icons.person_pin),
              labelText: Translations
                  .of(context)
                  .gender,
              labelStyle: TextStyle(
                color: Color(0xFF37505D),
                fontWeight: FontWeight.bold,
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
              ),
              errorText: state.hasError ? state.errorText : null,
            ),
            isEmpty: _gender == '',
            child: new DropdownButtonHideUnderline(
              child: new DropdownButton<String>(
                value: _gender,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    _gender = newValue;
                    state.didChange(newValue);
                  });
                },
                items: _genders.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dateOfBarth() {
    return Container(
      height: 40.0,
      child: new TextFormField(
        decoration: new InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
          prefixIcon: const Icon(Icons.calendar_today),
          suffixIcon: new IconButton(
            icon: new Icon(Icons.date_range),
            onPressed: (() {
              _chooseDate(context, dateTimeController.text);
            }),
          ),
          labelText: Translations
              .of(context)
              .dateOfBarth,
          labelStyle: TextStyle(
            color: Color(0xFF37505D),
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
          hintStyle: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
        controller: dateTimeController,
        keyboardType: TextInputType.datetime,
        validator: (val) =>
        isValidDateBarth(val)
            ? null
            : '${Translations
            .of(context)
            .not_valid_date}',
      ),
      margin: EdgeInsets.only(bottom: 5.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
        height: 40.0,
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
                )),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 10.0));
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
        height: 40.0,
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
              )),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 20.0));
  }

  Widget _phoneContainer() {
    return new Container(
      height: 40.0,
      child: new TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: Translations
                  .of(context)
                  .phone,
              labelStyle: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              )),
          keyboardType: TextInputType.phone),
      margin: EdgeInsets.only(bottom: 5.0),
    );
  }

//------------------------------------------------------------------------------
  Widget _registerButtonContainer() {
    return new Container(
        height: 50.0,
        width: double.infinity,
        //decoration: new BoxDecoration(color: Colors.deepOrange),
        child: new MaterialButton(
          height: 40.0,
          minWidth: 200.0,
          color: Color(0xFF13A1C5),
          splashColor: Color(0xFF009AFF),
          textColor: Colors.white,
          child: new Text(
            Translations
                .of(context)
                .save_infos,
            style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontSize: EventSizedConstants.TextButtonFontSized,
              fontWeight: FontWeight.bold,
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
          padding: EdgeInsets.all(15.0),
          onPressed: _registerButtonAction,
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------
  Widget _loginNowLabel() {
    return new GestureDetector(
      onTap: _goToLoginScreen,
      child: new Container(
          height: 40.0,
          child: new Text(
            Translations
                .of(context)
                .have_account,
            style: TextStyle(
              color: Color(0xFF37505D),
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  //check if the dateBarth is right or not
  bool isValidDateBarth(String birthDate) {
    if (birthDate.isEmpty) return true;
    var d = convertToDate(birthDate);
    return d != null && d.isBefore(new DateTime.now());
  }

//------------------------------------------------------------------------------
  void _registerButtonAction() {
    if (firstNameController.text == "" && lastNameController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          SnackBarText.ENTER_NAME,
          style: TextStyle(color: Colors.black),
        ),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          SnackBarText.ENTER_EMAIL,
          style: TextStyle(color: Colors.black),
        ),
      ));
      return;
    }

    if (!isValidEmail(emailController.text)) {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_VALID_MAIL),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          SnackBarText.ENTER_EMAIL,
          style: TextStyle(color: Colors.black),
        ),
      ));
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    _registerUser(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      genderController.text,
      passwordController.text,
      phoneController.text,
      dateTimeController.text,
    );
  }

//------------------------------------------------------------------------------
  void _registerUser(String firstName, String lastName, String gender,
      String phone, String email, String password, String birthDate) async {
    EventObject eventObject = await registerUser(
        firstName,
        lastName,
        gender,
        phone,
        email,
        password,
        birthDate);
    switch (eventObject.id) {
      case EventConstants.USER_REGISTRATION_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToLoginScreen();
          });
        }
        break;
      case EventConstants.USER_ALREADY_REGISTERED:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.USER_ALREADY_REGISTERED),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.USER_REGISTRATION_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }

//------------------------------------------------------------------------------

  void _goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new LoginPage()),
    );
  }
//------------------------------------------------------------------------------
}
