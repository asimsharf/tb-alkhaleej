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

  String get LOGIN_USER_UN_SUCCESSFUL {
    return Intl.message(
      'Wrong Email or Password!',
      name: 'LOGIN_USER_UN_SUCCESSFUL',
    );
  }

  String get name {
    return Intl.message(
      'Name',
      name: 'name',
    );
  }

  String get hospital {
    return Intl.message(
      'Hospital',
      name: 'hospital',
    );
  }

  String get ENTER_EMAIL {
    return Intl.message(
      'Please Enter your Email',
      name: 'ENTER_EMAIL',
    );
  }

  String get ENTER_PASS {
    return Intl.message(
      'Please Enter your Password',
      name: 'ENTER_PASS',
    );
  }

  String get edite_profile_user {
    return Intl.message(
      'Edite informations',
      name: 'edite_profile_user',
    );
  }

  String get login_successfully {
    return Intl.message(
      'Login Successfully',
      name: 'login_successfully',
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

  String get book {
    return Intl.message(
      'Book now',
      name: 'book',
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

  String get rating_number {
    return Intl.message(
      'Rating number',
      name: 'rating_number',
    );
  }

  String get specialty {
    return Intl.message(
      'Specializations',
      name: 'specialty',
    );
  }

  String get no_specialty {
    return Intl.message(
      'Sorry ther\'s now Specializations yet',
      name: 'no_specialty',
    );
  }

  String get no_ratings {
    return Intl.message(
      'Sorry No Ratings Yet!',
      name: 'no_ratings',
    );
  }

  String get search_by_hospital_name {
    return Intl.message(
      'Research by hospital name...',
      name: 'search_by_hospital_name',
    );
  }

  String get search_by_specialty_name {
    return Intl.message(
      'Research by specialty name...',
      name: 'search_by_specialty_name',
    );
  }

  String get search_by_insurance_name {
    return Intl.message(
      'Research by insurance company name...',
      name: 'search_by_insurance_name',
    );
  }

  String get not_insurance {
    return Intl.message(
      'Sorry insurance is not used!',
      name: 'not_insurance',
    );
  }

  String get search_by_pharmacy_name {
    return Intl.message(
      'Research by pharmacy name...',
      name: 'search_by_pharmacy_name',
    );
  }

  String get search_by_clinic_name {
    return Intl.message(
      'Research by clinic name...',
      name: 'search_by_clinic_name',
    );
  }

  String get search_by_department_name {
    return Intl.message(
      'Research by department name...',
      name: 'search_by_department_name',
    );
  }

  String get no_department {
    return Intl.message(
      'Sorry there\'r no department yet! ',
      name: 'no_department',
    );
  }

  String get no_hospital {
    return Intl.message(
      'Sorry there are no hospitals yet!',
      name: 'no_hospital',
    );
  }

  String get no_pharmacy {
    return Intl.message(
      'Sorry there are no pharmacies yet!',
      name: 'no_pharmacy',
    );
  }

  String get add_review {
    return Intl.message(
      'Add review',
      name: 'add_review',
    );
  }

  String get no_consultants {
    return Intl.message(
      'Sorry there are no consultants!',
      name: 'no_consultants',
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

  //###################################################################
  String get booking_history {
    return Intl.message(
      'Booking history',
      name: 'booking_history',
    );
  }

  String get cancel_booking_history {
    return Intl.message(
      'Successfully canceled booking',
      name: 'cancel_booking_history',
    );
  }

  String get cancel_booking {
    return Intl.message(
      'Cancel',
      name: 'cancel_booking',
    );
  }

  String get not_booking_yet {
    return Intl.message(
      'Sorry, you have not made a book yet!',
      name: 'not_booking_yet',
    );
  }

  String get confirm_booking {
    return Intl.message(
      'Confirm booking',
      name: 'confirm_booking',
    );
  }

  String get select {
    return Intl.message(
      'Select',
      name: 'select',
    );
  }

  String get date {
    return Intl.message(
      'Date',
      name: 'date',
    );
  }

  String get time {
    return Intl.message(
      'Time',
      name: 'time',
    );
  }

  String get department_name {
    return Intl.message(
      'Department name',
      name: 'department_name',
    );
  }

  String get center_name {
    return Intl.message(
      'Center name',
      name: 'center_name',
    );
  }

  String get patient_name {
    return Intl.message(
      'Patient name',
      name: 'patient_name',
    );
  }

  String get add_rating_review {
    return Intl.message(
      'Add rating review',
      name: 'add_rating_review',
    );
  }

  String get thanks_for_rating {
    return Intl.message(
      'Thank you for your rating :)',
      name: 'thanks_for_rating',
    );
  }

  String get please_add_rating {
    return Intl.message(
      'Please write an evaluation of the services :)',
      name: 'please_add_rating',
    );
  }

  String get system_error {
    return Intl.message(
      'Ooops there\'s error on the system please trye leater',
      name: 'system_error',
    );
  }

  String get not_booked {
    return Intl.message(
      'Sorry Booking not done tyle leater',
      name: 'not_booked',
    );
  }

  String get booking_okay_done {
    return Intl.message(
      'Your booking done Success',
      name: 'booking_okay_done',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
    );
  }

  String get pass_date_time {
    return Intl.message(
      'You can\'t book on past date time',
      name: 'pass_date_time',
    );
  }

  //##############################################################
  String get old_password {
    return Intl.message(
      'Old password',
      name: 'old_password',
    );
  }

  String get new_re_password {
    return Intl.message(
      'Re-password',
      name: 'new_re_password',
    );
  }

  String get fill_all_inputs {
    return Intl.message(
      'Sorry you must fill all the inputs',
      name: 'fill_all_inputs',
    );
  }

  String get not_much_password {
    return Intl.message(
      'Sorry password\'s not mutch',
      name: 'not_much_password',
    );
  }

  String get successfully_changed_password {
    return Intl.message(
      'Your password hass been successfuly updated',
      name: 'successfully_changed_password',
    );
  }

  String get incorrect_password {
    return Intl.message(
      'Sorry old password\'s Incorrect',
      name: 'incorrect_password',
    );
  }

  String get whatsapp {
    return Intl.message(
      'WebSite',
      name: 'whatsapp',
    );
  }

  String get website {
    return Intl.message(
      'Whatsapp',
      name: 'website',
    );
  }
}
