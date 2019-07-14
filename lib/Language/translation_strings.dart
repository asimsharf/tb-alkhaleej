import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tb_alkhalij/I10n/messages_all.dart';

class Translations {
  static Future<Translations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translations();
    });
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
    );
  }

  String get em_name {
    return Intl.message(
      'Name is empty',
      name: 'em_name',
    );
  }

  String get have_account {
    return Intl.message(
      'alredy have an account! Login',
      name: 'have_account',
    );
  }

  String get username {
    return Intl.message(
      'Username',
      name: 'username',
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
    );
  }

  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
    );
  }

  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
    );
  }

  String get verification_code {
    return Intl.message(
      'Verification code',
      name: 'verification_code',
    );
  }

  String get enter_verification_code {
    return Intl.message(
      'Enter verification code',
      name: 'enter_verification_code',
    );
  }

  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
    );
  }

  String get re_send {
    return Intl.message(
      'Resend after (3:00)',
      name: 're_send',
    );
  }

  String get not_valid_username {
    return Intl.message(
      'Not Valid Username',
      name: 'not_valid_username',
    );
  }

  String get password {
    return Intl.message(
      'password',
      name: 'password',
    );
  }

  String get re_password {
    return Intl.message(
      'Re-password',
      name: 're_password',
    );
  }

  String get password_is_too_short {
    return Intl.message(
      'password is too short',
      name: 'password_is_too_short',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
    );
  }

  String get register {
    return Intl.message(
      'Register',
      name: 'register',
    );
  }

  String get new_user {
    return Intl.message(
      'Create account',
      name: 'new_user',
    );
  }

  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
    );
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
    );
  }

  String get language {
    return Intl.message(
      'عربي',
      name: 'language',
    );
  }

  String get links {
    return Intl.message(
      'Links',
      name: 'links',
    );
  }

  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
    );
  }

  String get attendance {
    return Intl.message(
      'Attendance',
      name: 'attendance',
    );
  }

  String get support {
    return Intl.message(
      'Support',
      name: 'support',
    );
  }

  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
    );
  }

  String get did_you_forget_password {
    return Intl.message(
      'هل نسبت كلمة المرور؟ إعادة تعيين الأن',
      name: 'did_you_forget_password',
    );
  }

  String get title {
    return Intl.message(
      'طب الخليج الدائم',
      name: 'title',
    );
  }

  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
    );
  }

  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
    );
  }

  String get verify_password {
    return Intl.message(
      'Verify_password',
      name: 'verify_password',
    );
  }

  String get change {
    return Intl.message(
      'Change',
      name: 'change',
    );
  }

  String get select_language {
    return Intl.message(
      'Select language',
      name: 'select_language',
    );
  }

  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
    );
  }

  String get about_app {
    return Intl.message(
      'About applications',
      name: 'about_app',
    );
  }

  String get contact_infos {
    return Intl.message(
      'Contact information',
      name: 'contact_infos',
    );
  }

  String get pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'pharmacy',
    );
  }

  String get center {
    return Intl.message(
      'Hospital',
      name: 'center',
    );
  }

  String get clinic {
    return Intl.message(
      'Clinic',
      name: 'clinic',
    );
  }

  String get consulting {
    return Intl.message(
      'Consult',
      name: 'consulting',
    );
  }

  String get department {
    return Intl.message(
      'Department',
      name: 'department',
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
    );
  }

  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
    );
  }

  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
    );
  }
}
