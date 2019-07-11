import 'package:flutter/material.dart';
import 'package:tb_alkhalij/Account/UserProfile.dart';
import 'package:tb_alkhalij/Language/Language.dart';
import 'package:tb_alkhalij/Screen/Centers.dart';
import 'package:tb_alkhalij/Screen/CentersDetails.dart';
import 'package:tb_alkhalij/Screen/Clinic.dart';
import 'package:tb_alkhalij/Screen/ClinicDetails.dart';
import 'package:tb_alkhalij/Screen/Consulting.dart';
import 'package:tb_alkhalij/Screen/ConsultingDetails.dart';
import 'package:tb_alkhalij/Screen/Filter.dart';
import 'package:tb_alkhalij/Screen/pharmacy.dart';
import 'package:tb_alkhalij/Screen/pharmacyDetails.dart';
import 'package:tb_alkhalij/account/CreateUser.dart';
import 'package:tb_alkhalij/account/UserLogin.dart';
import 'package:tb_alkhalij/account/reset/ResetPassword.dart';

import '../MainPage.dart';
import 'About.dart';
import 'Help.dart';

final routes = <String, WidgetBuilder>{
  '/UserLogin': (BuildContext context) => UserLogin(),
  '/CreateUser': (BuildContext context) => CreateUser(),
  '/MainPage': (BuildContext context) => MainPage(),
  '/UserProfile': (BuildContext context) => UserProfile(),
  '/ResetPassword': (BuildContext context) => ResetPassword(),
  '/Language': (BuildContext context) => Language(),
  '/Help': (BuildContext context) => Help(),
  '/About': (BuildContext context) => About(),
  '/Center': (BuildContext context) => Centers(),
  '/CentersDetails': (BuildContext context) => CentersDetails(),
  '/Pharmacy': (BuildContext context) => Pharmacy(),
  '/PharmacyDetails': (BuildContext context) => PharmacyDetails(),
  '/Clinic': (BuildContext context) => Clinic(),
  '/ClinicDetails': (BuildContext context) => ClinicDetails(),
  '/Consulting': (BuildContext context) => Consulting(),
  '/ConsultingDetails': (BuildContext context) => ConsultingDetails(),
  '/Filter': (BuildContext context) => Filter(),
};
