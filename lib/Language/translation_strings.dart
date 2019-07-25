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

  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
    );
  }

  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
    );
  }

  String get fem_name {
    return Intl.message(
      'First Name is empty',
      name: 'fem_name',
    );
  }

  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
    );
  }

  String get em_phone {
    return Intl.message(
      'Phone number\'s empty',
      name: 'em_phone',
    );
  }

  String get lem_name {
    return Intl.message(
      'Last Name is empty',
      name: 'lem_name',
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
      'Email address',
      name: 'username',
    );
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
    );
  }

  String get edite_profile_user {
    return Intl.message(
      'Edite informations',
      name: 'edite_profile_user',
    );
  }

  String get save_infos {
    return Intl.message(
      'Save informations',
      name: 'save_infos',
    );
  }

  String get edit_profile {
    return Intl.message(
      'Edite User profile',
      name: 'edit_profile',
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

  String get address {
    return Intl.message(
      'Address',
      name: 'address',
    );
  }

  String get description {
    return Intl.message(
      'Description',
      name: 'description',
    );
  }

  String get insurances {
    return Intl.message(
      'Insurances',
      name: 'insurances',
    );
  }

  String get locations {
    return Intl.message(
      'Locations',
      name: 'locations',
    );
  }

  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
    );
  }

  String get ratings {
    return Intl.message(
      'Ratings',
      name: 'ratings',
    );
  }

  String get rating_review {
    return Intl.message(
      'Rating review',
      name: 'rating_review',
    );
  }

  String get add_review {
    return Intl.message(
      'Add review',
      name: 'add_review',
    );
  }

  String get add_rating {
    return Intl.message(
      'Add rating',
      name: 'add_rating',
    );
  }

  String get total_rating {
    return Intl.message(
      'Total rating',
      name: 'total_rating',
    );
  }

  String get tb_alkalij {
    return Intl.message(
      'Tb alkhalij',
      name: 'tb_alkalij',
    );
  }

  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
    );
  }

  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
    );
  }

  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
    );
  }

  String get dateOfBarth {
    return Intl.message(
      'Date of barth',
      name: 'dateOfBarth',
    );
  }

  String get enter_date_of_barth {
    return Intl.message(
      'Enter date of barth',
      name: 'enter_date_of_barth',
    );
  }

  String get not_valid_date {
    return Intl.message(
      'Not valid date of barth',
      name: 'not_valid_date',
    );
  }

  String get male {
    return Intl.message(
      'Male',
      name: 'male',
    );
  }

  String get female {
    return Intl.message(
      'Female',
      name: 'female',
    );
  }
}
